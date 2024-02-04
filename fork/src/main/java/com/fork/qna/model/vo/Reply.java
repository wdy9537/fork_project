package com.fork.qna.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@Data
@AllArgsConstructor
public class Reply {
	
	private int replyNo;
	private String replyContent;
	private int refBno;
	private String replyWriter;
	private String replyCreateDate;
	private String replyStatus;
	
	
}
