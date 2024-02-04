package com.fork.user.chart.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.user.chart.model.vo.Chart;
import com.fork.user.chart.model.vo.ChartCategory;

@Repository
public class ChartDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Chart> loadChart(Map<String, Date> day) {
		return sqlSession.selectList("chartMapper.loadChart", day);
	}

	public List<Chart> loadMenuChart(Map<String, Object> day) {
		System.out.println(day);
		List<Chart> c = sqlSession.selectList("chartMapper.loadMenuChart", day);
		
		System.out.println(c);
		
		for(Chart cc : c) {
			int menuNo = cc.getMenuNo();
			cc.setMenuName(sqlSession.selectOne("chartMapper.loadMenuNameChart", menuNo));
		}
		
		return c; 
	}

	public List<ChartCategory> selectChartCategory() {
		return sqlSession.selectList("chartMapper.selectChartCategory");
	}


}
