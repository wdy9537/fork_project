package com.fork.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@Data
@AllArgsConstructor
public class Attachment {
	
	private int faNo;
	private int refNno;
	private String faOriginName;
	private String faChangeName;
	private String faPath;
	private String faUploadDate;
	private String faStatus;
	
}
