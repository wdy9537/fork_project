package com.fork.notice.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fork.common.Utils;
import com.fork.common.template.Pagination;
import com.fork.common.vo.PageInfo;
import com.fork.member.model.vo.Member;
import com.fork.notice.model.service.NoticeService;
import com.fork.notice.model.vo.Attachment;
import com.fork.notice.model.vo.Notice;
import com.fork.notice.model.vo.NoticeExt;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@SessionAttributes("loginUser")
public class NoticeController {

	
	@Autowired 
	private NoticeService noticeService;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	// 공지사항 리스트 조회, 페이징처리, 검색기능 
	@GetMapping("/noticeList")
	public String selectList(
							@RequestParam(value="currentPage", defaultValue="1") int currentPage,
							Model model,
							@RequestParam Map<String, Object> paramMap //option검색!
							) {
		
		
		log.info("paramMap = {}", paramMap);
		List <Notice> list = noticeService.selectList(currentPage, paramMap);
		
		// 총 게시글 갯수
		int total = noticeService.selectListCount(paramMap);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);
		
		model.addAttribute("param", paramMap);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "notice/noticeListView";
		
	}
	
	
	 // 공지사항 등록 페이지로 이동
	 @GetMapping("/noticeEnroll") public String enrollNotice( Model model ) {
		 return "adNotice/adNoticeEnrollForm"; 
	 }
	
	// 공지사항 작성하기
	 @PostMapping("/noticeEnroll")
	 public String insertNotice(
	         Notice n,
	         @RequestParam(value = "upfile", required = false) List<MultipartFile> upfiles,
	         HttpSession session,
	         Model model,
	         @ModelAttribute("loginUser") Member loginUser
	 ) {
	     String webPath = "/resources/noticeFile/";
	     String severFolderPath = application.getRealPath(webPath);

	     n.setNoticeWriter(loginUser.getMemberNo() + "");

	     File dir = new File(severFolderPath);
	     if (!dir.exists()) {
	         dir.mkdirs();
	     }

	     List<Attachment> attachList = new ArrayList<>();

	     int level = -1;
	     for (MultipartFile upfile : upfiles) {
	         // input[name:upfile]로 만들어두면 비어있는 파일이 넘어올 수 있음
	         level++;
	         if (upfile.isEmpty()) continue;

	         // 1. 파일명 재정의해주는 함수.
	         String changeName = Utils.saveFile(upfile, severFolderPath);
	         Attachment at = Attachment
	                 .builder()
	                 .faChangeName(changeName)
	                 .faOriginName(upfile.getOriginalFilename())
	                 .build();
	         attachList.add(at);
	     }

	     int result = 0;

	     try {
	    	 
	         if (!attachList.isEmpty()) {
	             result = noticeService.insertNotice(n, attachList, severFolderPath, webPath);
	         } else {
	             session.setAttribute("alertMsg", "게시글 작성 완료");
	             return "redirect:/noticeList";
	         }
	     } catch (Exception e) {
	         log.error("error = {}", e.getMessage());
	     }

	     if (result > 0) {
	         session.setAttribute("alertMsg", "공지사항 작성 완료");
	         return "redirect:/noticeList";
	     } else {
	         model.addAttribute("alertMsg", "공지사항 작성 실패");
	         return "redirect:/noticeList";
	     }
	 }
	
	
	
	// 리스트에서 상세페이지로 이동
	@GetMapping("/noticeDetail/{noticeNo}")
	public String selectNotice(
			@PathVariable("noticeNo") int noticeNo,
			HttpSession session,
			Model model,
			HttpServletRequest req,
			HttpServletResponse res
			) {
		
		NoticeExt notice = noticeService.selectNotice(noticeNo);
		
		
		String url = "";
		
		model.addAttribute("notice", notice);
		log.info("모델에 잘 들어갔노 ={}", notice);
		
		url = "notice/noticeDetailView";
		
		if(notice != null) {
			
			
			String memberId = "";
			Member loginUser = (Member) session.getAttribute("loginUser");
			if(loginUser != null) {
				memberId = loginUser.getMemberId();
			}
			
			// 게시글의 작성자의 아이디와 현재 세션의 접속중인 아이디가 같지 않을 경우에만 조회수 증가
			if(!notice.getNoticeWriter().equals(memberId)) {
				
				
				Cookie cookie = null;
				
				Cookie[] cArr = req.getCookies(); 
				
				if(cArr != null && cArr.length > 0) {
					for( Cookie c : cArr) {
						if(c.getName().equals("readNoticeNo")) {
							cookie = c;
							break;
						}
					}
				}
				
				int result = 0;
				
				if(cookie == null ) { 
					
					cookie = new Cookie("readNoticeNo", noticeNo + ""); 
					
					result = noticeService.increaseCount(noticeNo);
				}else { 
					
					String[] arr = cookie.getValue().split("/");
					
					
					List<String> list = Arrays.asList(arr);
					
					if(list.indexOf(noticeNo + "") == -1) { 
						
						cookie.setValue(cookie.getValue()+"/"+noticeNo);
						result = noticeService.increaseCount(noticeNo); 
					}
					
				}
				
				if(result > 0) { 
					notice.setNoticeCount(notice.getNoticeCount()+1);
					
					cookie.setPath(req.getContextPath());
					cookie.setMaxAge(60*60*1); // 1시간만 유지
					res.addCookie(cookie);
				}
				
			}
			
		}else {
			model.addAttribute("errorMsg","게시글 조회 실패");
			url = "common/errorPage";
		}
		
		return url;
		
	}
	
	// 파일 다운
	@GetMapping("/notice/fileDownload/{faNo}")
	public ResponseEntity<Resource> fileDownload(
				@PathVariable("faNo") int faNo
			) throws UnsupportedEncodingException {
		
		ResponseEntity<Resource> responseEntity = null;
		Attachment attach = noticeService.selectAttachment(faNo);
		log.info("attach 확인! === {}", attach);
		if(attach == null) {
			return responseEntity.notFound().build();
		
		}
		
		String saveDirectory = application.getRealPath(attach.getFaPath());
		File downFile = new File(saveDirectory, attach.getFaChangeName());
	
		Resource resource = resourceLoader.getResource("file:"+downFile);
	
		String filename = new String(attach.getFaOriginName().getBytes("utf-8"), "iso-8859-1");
		
		
		responseEntity = ResponseEntity
				.ok()
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename="+filename)
				.body(resource);
				

		return responseEntity;
		
	}	
	
	// 공지사항 수정하기로 이동
	@GetMapping("/noticeUpdate/{noticeNo}")
	public String updateNotice(
			@PathVariable("noticeNo") int noticeNo,
			Model model) {
		
		NoticeExt notice = noticeService.selectNotice(noticeNo);
		notice.setNoticeContent(Utils.newLineClear(notice.getNoticeContent()));
		model.addAttribute("notice",notice);
		
		return "adNotice/adNoticeUpdateForm";
		
	} 
	
	// 공지사항 수정하기 (update)
	@PostMapping("/noticeUpdate/{noticeNo}")
	public String updateNotice(
			Notice n,
			@RequestParam(value="upfile", required= false) List<MultipartFile> upfiles,
			@PathVariable("noticeNo") int noticeNo,
			Model model, HttpSession session
			) {
		
		noticeService.deleteAttachmentsByNoticeNo(noticeNo);
		
		String webPath="/resources/noticeFile/";
		String severFolderPath = application.getRealPath(webPath);
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		n.setNoticeWriter(loginUser.getMemberNo()+"");
		n.setNoticeNo(noticeNo);
		
		log.info("notice 확인 ! ==== {}", n);
		

	   

		
		int result = 0;
		
		try {
			result = noticeService.updateNotice(n, upfiles, severFolderPath, webPath);
		} catch (Exception e) {
			log.error("error = {}", e.getMessage());
		}
		
		log.info("notice = {}",n);
		log.info("upfile = {}",upfiles);
		log.info("severFolderPath = {}",severFolderPath);
		log.info("webPath = {}",webPath);
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 수정 완료");
			return "redirect:/noticeDetail/"+noticeNo;
		}else {
			model.addAttribute("errorMsg","게시글 수정 실패");
			return "common/errorPage";
		}
		
		
		
	}
	
	
	// 공지사항 삭제하기
	@GetMapping("/deleteNotice/{noticeNo}")
	public String deleteNotice(
	    @PathVariable("noticeNo") int noticeNo, 
	    HttpSession session, Model model
	) {
	    int result = noticeService.deleteNotice(noticeNo);
	    
	    if (result > 0) {
	        // 삭제 작업 성공 시, 알림창을 띄우기 위해 확인 메시지를 세션에 저장
	        session.setAttribute("alertMsg", "삭제 완료");
	        return "redirect:/noticeList";
	    } else {
	        model.addAttribute("errorMsg", "삭제 실패");
	        return "common/errorPage";
	    }
	}
	
	
	
	@RequestMapping(value = "/deleteNoticeList")
	public String deleteCheck(HttpServletRequest request) {
		
		
	   String[] ajaxMsg = request.getParameterValues("valueArr");
	   int size = ajaxMsg.length;
	   
	   for(int i = 0; i<size; i++) {
		   noticeService.deleteCheck(ajaxMsg[i]);
	   }
	   
	   return "redirect:noticeList";
	    
	}
     
		
	
	
	
	
	
	
	
	
	
	
	
	
}
