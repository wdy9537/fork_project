package com.fork.user.chart.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fork.user.chart.model.dao.ChartDao;
import com.fork.user.chart.model.vo.Chart;
import com.fork.user.chart.model.vo.ChartCategory;

@Service
public class ChartServiceImpl implements ChartService {
	
	@Autowired
	private ChartDao chartDao;

	@Override
	public List<Chart> loadChart(Map<String, Date> day) {
		return chartDao.loadChart(day);
	}

	@Override
	public List<Chart> loadMenuChart(Map<String, Object> day) {
		return chartDao.loadMenuChart(day);
	}

	@Override
	public List<ChartCategory> selectChartCategory() {
		return chartDao.selectChartCategory();
	}

}
