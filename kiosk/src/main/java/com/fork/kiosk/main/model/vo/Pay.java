package com.fork.kiosk.main.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Pay{

	private int payNo;
	private Date payDate;
	private int price;
	
}
