package com.issac.react.dto.job;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MonthlyAppDTO {

	private int yr;
	private int mth;
	@JsonProperty("cnt")
	private int cnt;
	
	public MonthlyAppDTO() {
	}

	public MonthlyAppDTO(Object yr, Object mth, Object cnt) {
		this.yr = ((Double)yr).intValue();
		this.mth = ((Double)mth).intValue();
		this.cnt = ((Long)cnt).intValue();
	}


	@JsonProperty("yearMth")
	public String yearMth() {
		
		String strMth = null;
		switch (mth) {
		case 1: {

			strMth = "Jan";
			break;
		}
		case 2: {

			strMth = "Feb";
			break;
		}
		case 3: {

			strMth = "Mar";
			break;
		}
		case 4: {

			strMth = "Apr";
			break;
		}
		case 5: {

			strMth = "May";
			break;
		}
		case 6: {

			strMth = "Jun";
			break;
		}
		case 7: {

			strMth = "Jul";
			break;
		}
		case 8: {

			strMth = "Aug";
			break;
		}
		case 9: {

			strMth = "Sep";
			break;
		}
		case 10: {

			strMth = "Oct";
			break;
		}
		case 11: {

			strMth = "Nov";
			break;
		}
		case 12: {

			strMth = "Dec";
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + mth);
		}

		return strMth + " " + yr;
	}

	public int getYr() {
		return yr;
	}
	public int getMth() {
		return mth;
	}

	public int getCnt() {
		return cnt;
	}

}
