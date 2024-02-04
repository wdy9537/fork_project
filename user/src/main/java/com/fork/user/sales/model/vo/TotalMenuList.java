package com.fork.user.sales.model.vo;

import lombok.Data;

@Data
public class TotalMenuList {

	private int kioskNo;
	private String menuName;
	private int cnt;
	private int price;
	private String optionName;
	private int subPrice;
	private int totalPrice;
	
}
