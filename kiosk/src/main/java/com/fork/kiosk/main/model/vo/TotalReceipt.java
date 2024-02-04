package com.fork.kiosk.main.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class TotalReceipt{

	private int trNo;
	private int kioskNo;
	private String orderStatus;
	List<Receipt> rList;
}
