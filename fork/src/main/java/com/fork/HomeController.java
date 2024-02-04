package com.fork;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home() {
		return "forward:index.jsp";
	}
	
	@GetMapping("/login")
	public String login() {
		return "common/login";
	}
	
	@GetMapping("/companyInfo")
	public String companyInfo() {
		return "common/companyInfo";
	}
	
	@GetMapping("/contectUs")
	public String contectUs() {
		return "common/contectUs";
	}
	
	@GetMapping("/shopInfo")
	public String shopInfo() {
		return "common/shopInfo";
	}
	
//	@GetMapping("/noticeListView")
//	public String noticeListView() {
//		return "notice/noticeListView";
//	}
	
	@GetMapping("/qnaListView")
	public String qnaListView() {
		return "qna/qnaListView";
	}
	
	@GetMapping("/adSignupApproval")
	public String adSignupApproval() {
		return "common/adSignupApproval";
	}
	
	@GetMapping("/adShopList")
	public String adShopList() {
		return "common/adShopList";
	}
	
	@GetMapping("/adNoticeListView")
	public String adNoticeListView() {
		return "adNotice/adNoticeListView";
	}
	
	@GetMapping("/adQnaListView")
	public String adQnaListView() {
		return "adQna/adQnaListView";
	}
	
	
	
	
}
