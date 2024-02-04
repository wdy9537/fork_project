package com.fork.user.kitchen.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class PayStructure {
	
	private int trNo;
	private Date payDate;
	private String strucTitle;
	
	List<MenuOption> MenuOption;
	
}
