package com.fork.user.management.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class Menu {

	private int menuNo;
	private String menuName;
	private String menuDetail;
	private int price;
	private String OriginName;
	private String changeName;
	private int categoryNo;
	private String filePath;
	
	List<Menu> menuList;
	
}
