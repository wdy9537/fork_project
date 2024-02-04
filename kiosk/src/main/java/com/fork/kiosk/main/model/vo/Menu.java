package com.fork.kiosk.main.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Menu{

	private int menuNo;
	private String menuName;
	private String menuDetail;
	private int price;
	private String originName;
	private String changeName;
	private String filePath;
	private int categoryNo;
	
	List<Opt> optList;
	
}
