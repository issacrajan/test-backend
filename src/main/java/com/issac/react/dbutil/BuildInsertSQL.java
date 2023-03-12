package com.issac.react.dbutil;

import java.io.File;
import java.io.FileReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class BuildInsertSQL {

	private String configFile;
	private Connection srcConn;
	private String[] tables;
	private DatabaseMetaData databaseMetaData;
	private String outputFolder;

	public static void main(String[] args) throws Exception {
		String configFileName = "/home/issac/work/ws-react-app/test-backend/data-source.properties";
		BuildInsertSQL main = new BuildInsertSQL();
		if (args.length > 0) {
			configFileName = args[0];
		}
		main.configFile = configFileName;
		main.init();
		main.process();

		System.out.println("done");
	}

	private void init() throws Exception {
		Properties prop = new Properties();
		prop.load(new FileReader(new File(configFile)));
//		String driver = prop.getProperty("Database.driver");
		String url = prop.getProperty("datasource.url");
		String databaseUser = prop.getProperty("datasource.username");
		String databasePwd = prop.getProperty("datasource.password");
		String tablesList = prop.getProperty("tables.list");
		outputFolder = prop.getProperty("output.folder");
		tables = tablesList.split(",");

		Properties dbProps = new Properties();
		dbProps.setProperty("user", databaseUser);
		dbProps.setProperty("password", databasePwd);
//		dbProps.setProperty("ssl", "true");
		srcConn = DriverManager.getConnection(url, dbProps);
		databaseMetaData = srcConn.getMetaData();
	}

	private void process() throws Exception {
		for (String table : tables) {
			processTable(table);
		}
	}

	private List<columnDTO> columnList;

	private void processTable(String tableName) throws Exception {
		columnList = new ArrayList<>();
		StringBuilder sqlInsert = new StringBuilder("INSERT INTO (");
		int colCnt = 0;
		try (ResultSet columns = databaseMetaData.getColumns(null, null, tableName, null)) {
			while (columns.next()) {
				colCnt++;
				String columnName = columns.getString("COLUMN_NAME");
				String columnSize = columns.getString("COLUMN_SIZE");
				if (colCnt > 1) {
					sqlInsert.append(",");
				}
				sqlInsert.append(columnName);
				int datatype = columns.getInt("DATA_TYPE");
				System.out.println(columnName + "==" + datatype);
				columnList.add(new columnDTO(columnName, columnSize, datatype));
			}

			sqlInsert.append(") VALUES (");
		}

		String outputFile = "";
		if (!isEmpty(outputFolder)) {
			outputFile = outputFolder + File.separator;
		}
		outputFile = outputFile + tableName + ".sql";

		File outFile = new File(outputFile);
		System.out.println(outFile.getAbsolutePath());
		PrintWriter outputWriter = new PrintWriter(outFile);
		PreparedStatement ps = srcConn.prepareStatement("select * from " + tableName);
		int recCnt = 0;
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			colCnt = 0;
			recCnt++;
			StringBuilder sql = new StringBuilder(sqlInsert);
			for (columnDTO col : columnList) {
				colCnt++;
				if (colCnt > 1) {
					sql.append(",");
				}

				String val = rs.getString(col.getColumnName());
				boolean isNull = false;
				if (rs.wasNull()) {
					isNull = true;
					val = "null";
				}
				if (col.isInt() || isNull) {
					sql.append(val);
				} else {
					sql.append(replaceQuate(val));
				}
			}

			sql.append(");");
			outputWriter.println(sql.toString());
		}

		outputWriter.close();
		System.out.println(tableName + " : count: " + recCnt);
	}

	private String replaceQuate(String s) {
		return "'" + s.replace("'", "'''") + "'";
	}

	private boolean isEmpty(String s) {
		return s == null || s.isBlank();
	}
}

class columnDTO {
	private String columnName;
	private String columnSize;
	private int dataType;

	public columnDTO(String columnName, String columnSize, int dataType) {
		this.columnName = columnName;
		this.columnSize = columnSize;
		this.dataType = dataType;
	}

	public boolean isInt() {
		return dataType == Types.INTEGER || dataType == Types.BIGINT || dataType == Types.DECIMAL
				|| dataType == Types.FLOAT;
	}

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getColumnSize() {
		return columnSize;
	}

	public void setColumnSize(String columnSize) {
		this.columnSize = columnSize;
	}

	public int getDataType() {
		return dataType;
	}

	public void setDataType(int dataType) {
		this.dataType = dataType;
	}

	@Override
	public String toString() {
		return "columnDTO [columnName=" + columnName + ", columnSize=" + columnSize + ", dataType=" + dataType
				+ "]";
	}

}
