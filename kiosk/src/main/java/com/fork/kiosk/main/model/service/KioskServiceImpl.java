package com.fork.kiosk.main.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fork.kiosk.main.model.dao.KioskDao;
import com.fork.kiosk.main.model.vo.Category;
import com.fork.kiosk.main.model.vo.Coo;
import com.fork.kiosk.main.model.vo.TotalReceipt;

@Service
public class KioskServiceImpl implements KioskService {

	@Autowired
	private KioskDao kioskDao;

	@Override
	public List<Category> selectCategoryAndMenuAndOptions() {
		return kioskDao.selectCategoryAndMenuAndOptions();
	}

	@Override
	public List<Coo> selectCoo() {
		return kioskDao.selectCoo();
	}
	
	@Override
	public TotalReceipt selectTotalReceipt(Integer kioskNo){
		return kioskDao.selectTotalReceipt(kioskNo);
	}

	// basicPay
	@Override
	public int selectTotalReceiptNo(HashMap<String, Object> param) {
		int result = kioskDao.selectTotalReceiptNo(param);
		if(result == 0) {
			result = kioskDao.insertTotalReceiptNo(param);
		}else {
			param.put("totalReceiptNo", result);
		}
		return result;
	}

	@Override
	public int insertPay(HashMap<String, Object> param) {
		return kioskDao.insertPay(param);
	}

	@Override
	public int insertReceipt(HashMap<String, Object> param) {
		return kioskDao.insertReceipt(param);
	}

	@Override
	public int insertReceiptMenus(HashMap<String, Object> param) {
		return kioskDao.insertReceiptMenus(param);
	}

	@Override
	public int insertDutchPay(HashMap<String, Object> param) {
		return kioskDao.insertDutchPay(param);
	}

	@Override
	public int insertReceiptMenusDutchPay(HashMap<String, Object> param) {
		return kioskDao.insertReceiptMenusDutchPay(param);
	}
	
	
}
