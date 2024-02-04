package com.fork.member.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.fork.member.model.service.MemberService;
import com.fork.member.model.vo.Member;
import com.fork.qna.model.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginUser")
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired 
	private QnaService qnaService;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 로그인
	@PostMapping("/login.me")
	public String loginMember( 
							  @ModelAttribute Member m, 
							  HttpSession session, 
							  Model model
							  ) {
		
		Member loginUser = mService.loginUser(m);
		
		log.info("컨트롤러 {}", m);
		
		String url = "";
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			session.setAttribute("loginUser", loginUser);
			url = "redirect:/";
		}else {
			session.setAttribute("alertMsg", "아이디 또는 비밀번호가 일치하지 않습니다. 다시 로그인 해주세요.");
			url = "redirect:/";
		}
				
		return url;
	}
	
	// 로그아웃
	@GetMapping("/logout.me")
	public String logoutMember(HttpSession session, SessionStatus status) {
		
		session.invalidate();
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	// 가입승인 리스트 받아오기
	@GetMapping("/singupList")
	public String signupList(Model model) {
		
		List<Member> list = mService.selectList();
		
		model.addAttribute("list", list);
		
		log.info("model = {}", model);
		return "/common/adSignupApproval";
		
	}
	
	// 가입승인 승인(멤버 상태 Y로 update)
	@PostMapping(value = "/approveMember", consumes = "application/json", produces = "application/json")
	public String approveMember(@RequestBody Map<String, Integer> requestData) {
	    int memberNo = requestData.get("memberNo");
	    
	    
	    int result = mService.approveMember(memberNo);
	       
	    if(result > 0) {
	    	return "error";
	    }else {
	    	return "success";
	    }
	    
	}
	
	// 가입승인 거절 (멤버 삭제)
	@PostMapping(value = "/rejectMember", consumes = "application/json", produces = "application/json")
	public String rejectMember(@RequestBody Map<String, Integer> requestData) {
	    int memberNo = requestData.get("memberNo");
	    
	    int result = mService.rejectMember(memberNo);
	       
	    if(result > 0) {
	    	return "error";
	    }else {
	    	return "success";
	    }
	    
	}
	
	// 가맹점 현황 리스트 불러오기
	@GetMapping("/shopList")
	public String shopList(Model model) {
		
		List<Member> list = mService.selectShopList();
		
		model.addAttribute("list", list);
		
		log.info("model = {}", model);
		return "/common/adShopList";
		
	}
	
	// 가맹점 현황 리스트 체크박스 삭제
	@RequestMapping("/deleteShopList")
	public String deleteCheck(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		   int size = ajaxMsg.length;
		   
		   for(int i = 0; i<size; i++) {
			   mService.deleteCheck(ajaxMsg[i]);
		   }
		   
		   return "redirect:shopList";
	}
	
	
	// 가맹점 현황 상세보기
	@GetMapping("/adShopDetail/{memberNo}")
	public String selectShop(
			@PathVariable("memberNo") int memberNo,
			HttpSession session,
			Model model
			) {
		
		Member member = mService.selectShop(memberNo);
		
		model.addAttribute("member", member);
		
		return "common/adShopDetailView";
		
	}
	
	
	/*
	 * // 파일 다운
	 * 
	 * @GetMapping("/shopDetail/fileDownload/{memberNo}") public
	 * ResponseEntity<Resource> fileDownload(
	 * 
	 * @PathVariable("memberNo") int memberNo ) throws UnsupportedEncodingException
	 * {
	 * 
	 * ResponseEntity<Resource> responseEntity = null; Member member =
	 * mService.selectShop(memberNo); log.info("member 확인! === {}", member);
	 * if(member == null) { return responseEntity.notFound().build();
	 * 
	 * }
	 * 
	 * String filePath = "/resources/file"; String saveDirectory =
	 * application.getRealPath(filePath); File downFile = new File(saveDirectory,
	 * member.getFileChangeName());
	 * 
	 * Resource resource = resourceLoader.getResource("file:"+downFile);
	 * 
	 * String filename = new String(member.getFileOriginName().getBytes("utf-8"),
	 * "iso-8859-1");
	 * 
	 * 
	 * responseEntity = ResponseEntity .ok() .header(HttpHeaders.CONTENT_TYPE,
	 * MediaType.APPLICATION_OCTET_STREAM_VALUE)
	 * .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename="+filename)
	 * .body(resource);
	 * 
	 * 
	 * return responseEntity;
	 * 
	 * }
	 */
	
	// 가맹점 삭제하기
	@GetMapping("/deleteShop/{memberNo}")
	public String deleteShop(
			@PathVariable("memberNo") int memberNo, 
			HttpSession session, Model model
			) {
		
		int result2 = qnaService.deleteShopReply(memberNo);
		
		int result = mService.deleteShop(memberNo);
		
	    if (result > 0 && result2 > 0) {
	        session.setAttribute("alertMsg", "가맹점 삭제 완료");
	        return "redirect:/shopList";
	    } else {
	        model.addAttribute("errorMsg", "가맹점 삭제 실패");
	        return "redirect:/shopList";
	    }
	}
	
	
	
	
	
	
	
	
}
