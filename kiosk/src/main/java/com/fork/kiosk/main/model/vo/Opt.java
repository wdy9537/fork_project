package com.fork.kiosk.main.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Opt{

	private int optionNo;
	private String optionName;
	private int price;
	private int prOptionNo;
	private int menuNo;
	
}
