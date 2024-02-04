package com.fork.kiosk.main.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fork.kiosk.main.model.service.KioskService;
import com.fork.kiosk.main.model.vo.Category;
import com.fork.kiosk.main.model.vo.Coo;
import com.fork.kiosk.main.model.vo.TotalReceipt;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class KioskController {

	@Autowired
	private KioskService kioskService;
	
	@GetMapping("/category")
	public List<Category> category(HttpServletResponse response){
		try {
			List<Category> list = kioskService.selectCategoryAndMenuAndOptions();
			log.info("dd {}", list);
			return list;
		}catch(Exception e) {
			throw e;
		}
		
	}
	
	@GetMapping("/coo")
	public List<Coo> coo(HttpServletResponse response){
		
		List<Coo> cooList = kioskService.selectCoo();
		log.info("cooList : {} ", cooList);
		return cooList;
		
	}
	
	@PostMapping("/receipt/{kioskNo}")
	public TotalReceipt totalReceiptTest(@PathVariable("kioskNo") int kioskNo , HttpSession session){
		session.setAttribute("kioskNo", kioskNo);
//		log.info("kioskNo:{}", kioskNo);
		TotalReceipt totalReceipt = kioskService.selectTotalReceipt(kioskNo);
		log.info("list : {}" , totalReceipt);
		return totalReceipt;
	}
	
	@PostMapping("/basicPay/{kioskNo}")
	public int basicPay( @PathVariable("kioskNo") int kioskNo ,
						 @RequestBody HashMap<String ,Object> param) {
		
		param.put("kioskNo", kioskNo);
		
		// 총영수증 번호 조회 및 없을 시 insert후 재조회
		int totalReceiptNo = kioskService.selectTotalReceiptNo(param);
		log.info("param : {}" , param);
		log.info("totalReceiptNo : {}" , totalReceiptNo);
		if(totalReceiptNo > 0) {
			// 결제테이블 insert
			int payNo = kioskService.insertPay(param);
			log.info("payNo : {}" , payNo);
			if(payNo > 0) {
				// 영수증테이블 insert
				int receiptNo = kioskService.insertReceipt(param);
				log.info("receiptNo : {}" , receiptNo);
				if(receiptNo > 0) {
					// 영수증별메뉴, 옵션 insert
					int result = kioskService.insertReceiptMenus(param);
					receiptNo = (int)param.get("receiptNo");
					log.info("result : {}" , result);
					if(result > 0) {
						log.info("param : {}" , param);
						// 오직 이 경우에만 정상적으로 모든 데이터가 insert
						return receiptNo;
					}
				}
			}
		}
		return 0;
	}
	
	@PostMapping("/dutchPay/{kioskNo}")
	public int dutchPay( @PathVariable("kioskNo") int kioskNo , 
							@RequestBody HashMap<String ,Object> param ) {
		
		param.put("kioskNo", kioskNo);
		
		// 총영수증 번호 조회 및 없을 시 insert후 재조회
		int totalReceiptNo = kioskService.selectTotalReceiptNo(param);
		log.info("param : {}" , param);
		log.info("totalReceiptNo : {}" , totalReceiptNo);
		if(totalReceiptNo > 0) {
			// 결제테이블 insert
			int payNo = kioskService.insertDutchPay(param);
			log.info("payNo : {}" , payNo);
			if(payNo > 0) {
				// 영수증테이블 insert
				int receiptNo = kioskService.insertReceipt(param);
				log.info("receiptNo : {}" , receiptNo);
				if(receiptNo > 0) {
					// 영수증별메뉴, 옵션 insert
					int result = kioskService.insertReceiptMenusDutchPay(param);
					receiptNo = (int)param.get("receiptNo");
					log.info("result : {}" , result);
					if(result > 0) {
						log.info("param : {}" , param);
						// 오직 이 경우에만 정상적으로 모든 데이터가 insert
						return receiptNo;
					}
				}
			}
		}
		// 오류
		return 0;
	}
	
	/*
	 * @GetMapping("/receipt") public ResponseEntity<?> getReceiptData(HttpServletRequest request) { 
	 * HttpSession session = request.getSession(); Integer kioskNo = (Integer) session.getAttribute("kioskNo");
	 * 
	 * if (kioskNo != null) { 
	 * List<receipt> receipt = kioskService.getReceiptData(kioskNo); 
	 * return ResponseEntity.ok(getReceiptData); 
	 * } else { 
	 * return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("세션이 없거나 유효하지 않습니다."); }
	 * }
	 */

    
}