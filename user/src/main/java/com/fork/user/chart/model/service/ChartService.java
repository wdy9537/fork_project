package com.fork.user.chart.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.fork.user.chart.model.vo.Chart;
import com.fork.user.chart.model.vo.ChartCategory;

public interface ChartService {

	List<Chart> loadChart(Map<String, Date> day);

	List<Chart> loadMenuChart(Map<String, Object> day);
	
	List<ChartCategory> selectChartCategory();
	

}
