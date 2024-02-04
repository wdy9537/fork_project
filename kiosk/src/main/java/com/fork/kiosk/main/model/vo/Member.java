package com.fork.kiosk.main.model.vo;

import lombok.Data;

@Data
public class Member {

	private String memberName;
	private String fileNo; // 사업자번호
	private String address;
	private String phone;
	private String modifyDate;
	private String status;
	
}
