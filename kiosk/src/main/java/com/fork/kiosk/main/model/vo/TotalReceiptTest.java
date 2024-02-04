package com.fork.kiosk.main.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class TotalReceiptTest{

	private int trNo;
	private int kioskNo;
	private String orderStatus;
	
	private int receiptNo;
	private int payNo;
    
	private int RcmNo;
	private int menuNo;
	private int cnt;
    
	private int optionNo;
    
	private Date payDate;
	private int totalPrice;
	private String menuName;
	private int menuPrice;
	
	private String optionName;
	private int optionPrice;
	
}
