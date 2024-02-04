package com.fork.user.kitchen.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fork.user.kitchen.model.dao.KitchenDao;
import com.fork.user.kitchen.model.vo.MenuOption;
import com.fork.user.kitchen.model.vo.PayStructure;

@Service
public class KitchenServiceImpl implements KitchenService {
	
	@Autowired
	private KitchenDao kitchenDao;

	@Override
	public List<PayStructure> selectPaylist() {
		return kitchenDao.selectPaylist();
	}

	@Override
	public List<MenuOption> selectTotalMenulist(int no) {
		return kitchenDao.selectTotalMenulist(no);
	}
	
	@Override
	public List<MenuOption> selectMenulist(ArrayList<Integer> receiptNoList) {
		return kitchenDao.selectMenulist(receiptNoList);
	}

	@Override
	public PayStructure selectTableInfo(int rno) {
		return kitchenDao.selectTableInfo(rno);
	}


}
