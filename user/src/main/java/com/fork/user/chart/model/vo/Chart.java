package com.fork.user.chart.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Chart {
	private Date payDate;
	private int price;
	private int menuNo;
	private String menuName;
	private int count;
}
