package com.fork.user.kitchen.model.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.user.kitchen.model.vo.MenuOption;
import com.fork.user.kitchen.model.vo.PayStructure;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class KitchenDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<PayStructure> selectPaylist() {
		return sqlSession.selectList("kitchenMapper.selectPaylist");
	}
	
	public List<MenuOption> selectTotalMenulist(int no) {
		
		return sqlSession.selectList("kitchenMapper.selectTotalMenulist", no);
	}

	public List<MenuOption> selectMenulist(ArrayList<Integer> receiptNoList) {
		
		List<MenuOption> menuList = new ArrayList<MenuOption>();
		
		for(Integer no : receiptNoList) {
			List<MenuOption> menus = sqlSession.selectList("kitchenMapper.selectMenulist", no);
			
			if ( menus != null ) {
				for(MenuOption menu : menus) {
					menuList.add(menu);
					log.info("menu={}", menu);
				}
			}
		}
		
		
		return menuList;
	}

	public PayStructure selectTableInfo(int rno) {
		return sqlSession.selectOne("kitchenMapper.selectTableInfo", rno);
	}
	
	

}

