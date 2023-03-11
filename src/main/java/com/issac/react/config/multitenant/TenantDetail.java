package com.issac.react.config.multitenant;

/**
 * 
 * @author issac
 *
 */
public class TenantDetail {

	private String name;
	private String dbDriver;
	private String dbUrl;
	private String dbUser;
	private String dbPassword;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDbDriver() {
		return dbDriver;
	}

	public void setDbDriver(String dbDriver) {
		this.dbDriver = dbDriver;
	}

	public String getDbUrl() {
		return dbUrl;
	}

	public void setDbUrl(String dbUrl) {
		this.dbUrl = dbUrl;
	}

	public String getDbUser() {
		return dbUser;
	}

	public void setDbUser(String dbUser) {
		this.dbUser = dbUser;
	}

	public String getDbPassword() {
		return dbPassword;
	}

	public void setDbPassword(String dbPassword) {
		this.dbPassword = dbPassword;
	}

	@Override
	public String toString() {
		return "TenantDetail [name=" + name + ", dbDriver=" + dbDriver + ", dbUrl=" + dbUrl + ", dbUser="
				+ dbUser + ", dbPassword=" + dbPassword + "]";
	}

}
