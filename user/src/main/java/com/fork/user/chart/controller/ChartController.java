package com.fork.user.chart.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fork.user.chart.model.service.ChartService;
import com.fork.user.chart.model.vo.Chart;
import com.fork.user.chart.model.vo.ChartCategory;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChartController {
	
	@Autowired
    private ChartService chartService;
	
	@GetMapping("/chart")
	@ResponseBody
    public List<Chart> loadChart(Date startDay, Date endDay) {
		
		Map<String, Date> day = new HashMap<String ,Date>();
		day.put("startDay", startDay);
		day.put("endDay", endDay);
		
		List<Chart> list = chartService.loadChart(day);
        return list;
    }
	
	@GetMapping("/menuChart")
	@ResponseBody
    public List<Chart> loadMenuChart(Date startDay, Date endDay, int prCateNo) {
		
		Map<String, Object> day = new HashMap<String ,Object>();
		day.put("startDay", startDay);
		day.put("endDay", endDay);
		day.put("prCateNo", prCateNo);
		
		List<Chart> list = chartService.loadMenuChart(day);
		
		log.info("list= {}", list);
		
        return list;
    }
	
	@GetMapping("/selectPrCategory")
	@ResponseBody
    public List<ChartCategory> selectCategory() {
		
		List<ChartCategory> list = chartService.selectChartCategory();
		System.out.println("pr : "+list);
		
        return list;
    }
	
}
