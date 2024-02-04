package com.fork.user.kitchen.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fork.user.kitchen.model.service.KitchenService;
import com.fork.user.kitchen.model.vo.MenuOption;
import com.fork.user.kitchen.model.vo.PayStructure;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class KitchenController {
	
	@Autowired
	private KitchenService kitchenService;
	
	@GetMapping("/kitchen")
    public String toKitchen(Model model) {
		List<PayStructure> orderList = kitchenService.selectPaylist();
		List<PayStructure> list = new ArrayList<>();

		for (PayStructure order : orderList) {
			List<MenuOption> menuList = kitchenService.selectTotalMenulist(order.getTrNo());
			if ( menuList.size() > 0 ) {
				order.setMenuOption(menuList);
				list.add(order);
			}
			
		}
		
		log.info("orderList ={}", list);
		model.addAttribute("orderList", list);
		
		return "kitchen/kitchen";
        
    }
	
	@PostMapping("/kitchen/newOrder/{kno}")
	@ResponseBody
	public PayStructure newOrder(@PathVariable("kno") int kioskNo, @RequestParam(value="receiptNoList[]") ArrayList<Integer> receiptNoList) {
		
		log.info("receiptNoList={}", receiptNoList);
		log.info("kioskNo={}", kioskNo);
		
		// 테이블정보 조회
		PayStructure newOrder = null;
		PayStructure order = kitchenService.selectTableInfo(kioskNo);
		log.info("order={}", order);
		
		List<MenuOption> menuList = new ArrayList();
		if ( order != null ) {
			menuList = kitchenService.selectMenulist(receiptNoList);
			log.info("menuList={}", menuList);
			order.setMenuOption(menuList);
			newOrder = order;
			if( menuList == null ) {
				newOrder = null;
			}
		}
		
		return newOrder;		
		
	}
	
}

