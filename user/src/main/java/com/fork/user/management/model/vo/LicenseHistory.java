package com.fork.user.management.model.vo;

import lombok.Data;

@Data
public class LicenseHistory {

	private int lhNo;
	private int licenseNo;
	private int memberNo;
	private String lhDate;
	private String lhDay;
	private String lhStatus;
	
}
