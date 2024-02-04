package com.fork.user.management.model.vo;

import lombok.Data;

@Data
public class MenuList extends Menu {

	private int menuNo;
	private String menuName;
	private String menuDetail;
	private int price;
	private String OriginName;
	private String changeName;
	private int categoryNo;
	private String filePath;
	private String categoryName;
	
}
