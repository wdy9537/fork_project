package com.fork.user.kitchen.model.service;

import java.util.ArrayList;
import java.util.List;

import com.fork.user.kitchen.model.vo.MenuOption;
import com.fork.user.kitchen.model.vo.PayStructure;

public interface KitchenService {

	List<PayStructure> selectPaylist();
	
	List<MenuOption> selectTotalMenulist(int no);

	List<MenuOption> selectMenulist(ArrayList<Integer> receiptNoList);

	PayStructure selectTableInfo(int rno);

	
}
