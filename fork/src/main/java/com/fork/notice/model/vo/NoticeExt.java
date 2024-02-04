package com.fork.notice.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class NoticeExt extends Notice {
	
	private List<Attachment> attachList;
}
