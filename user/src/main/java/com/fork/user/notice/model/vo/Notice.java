package com.fork.user.notice.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class Notice implements Serializable {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private int noticeCount;
	private String noticeCreateDate;
	private String noticeStatus;
	private int newNotice;
	
}
