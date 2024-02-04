package com.fork.kiosk.main.model.service;

import java.util.HashMap;
import java.util.List;

import com.fork.kiosk.main.model.vo.Category;
import com.fork.kiosk.main.model.vo.Coo;
import com.fork.kiosk.main.model.vo.TotalReceipt;

public interface KioskService {

	List<Category> selectCategoryAndMenuAndOptions();

	List<Coo> selectCoo();

	TotalReceipt selectTotalReceipt(Integer kioskNo);

	// basicPay
	int selectTotalReceiptNo(HashMap<String, Object> param);

	int insertPay(HashMap<String, Object> param);

	int insertReceipt(HashMap<String, Object> param);

	int insertReceiptMenus(HashMap<String, Object> param);

	int insertDutchPay(HashMap<String, Object> param);

	int insertReceiptMenusDutchPay(HashMap<String, Object> param);
	

}
