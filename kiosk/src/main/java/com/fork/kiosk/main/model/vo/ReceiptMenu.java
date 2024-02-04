package com.fork.kiosk.main.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class ReceiptMenu{
	private int rcmNo;
	private int receiptNo;
	private int menuNo;
	private int cnt;
	
	private Menu menu;
	List<ReceiptOption> roList;
}
