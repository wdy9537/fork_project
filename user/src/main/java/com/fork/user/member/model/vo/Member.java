package com.fork.user.member.model.vo;

import lombok.Data;

@Data
public class Member {

	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String fileNo;
	private String fileOriginName;
	private String fileChangeName;
	private String address;
	private String phone;
	private String email;
	private int extraNumber;
	private String modifyDate;
	private String status;
	
}
