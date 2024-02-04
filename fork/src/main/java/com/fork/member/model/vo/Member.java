package com.fork.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String fileNo; //사업자 등록증 번호
	private String fileOriginName; // 사업자 등록증 원본파일
	private String fileChangeName; // 사업자 등록증 암호화 파일
	private String address;
	private String phone;
	private String email;
	private String extraNumber; // 인증번호? 
	private String modifyDate; 
	private String status; // 가입승인여부
	
}
