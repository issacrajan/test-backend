package com.issac.react.dto;

import java.util.List;

public class JobStatsContainer {

	private JobStatsDTO stats;
	private  List<MonthlyAppDTO> monthlyApp;
	
	public JobStatsDTO getStats() {
		return stats;
	}

	public void setStats(JobStatsDTO stats) {
		this.stats = stats;
	}

	public List<MonthlyAppDTO> getMonthlyApp() {
		return monthlyApp;
	}

	public void setMonthlyApp(List<MonthlyAppDTO> monthlyApp) {
		this.monthlyApp = monthlyApp;
	}
	
}
