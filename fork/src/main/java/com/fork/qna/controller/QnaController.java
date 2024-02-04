package com.fork.qna.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fork.common.Utils;
import com.fork.common.template.Pagination;
import com.fork.common.vo.PageInfo;
import com.fork.member.model.vo.Member;
import com.fork.notice.model.vo.Notice;
import com.fork.notice.model.vo.NoticeExt;
import com.fork.qna.model.service.QnaService;
import com.fork.qna.model.vo.Qna;
import com.fork.qna.model.vo.QnaExt;
import com.fork.qna.model.vo.Reply;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginUser")
public class QnaController {

	@Autowired 
	private QnaService qnaService;
	
	
	// 리스트 조회, 검색기능 
	@GetMapping("/qnaList")
	public String selectList(
							@RequestParam(value="currentPage", defaultValue="1") int currentPage,
							Model model,
							@RequestParam Map<String, Object> paramMap //option검색!
							) {
		
		
		List <Qna> list = qnaService.selectList(currentPage, paramMap);
		
		// 총 게시글 갯수
		int total = qnaService.selectListCount(paramMap);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);
		
		model.addAttribute("param", paramMap);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "qna/qnaListView";
		
	}
	
	
	// qna 등록 페이지로 이동
	 @GetMapping("/qnaEnroll") public String enrollQna( Model model ) {
		 return "qna/qnaEnrollForm"; 
	 }
	
	
	// 공지사항 작성하기
	@PostMapping("/qnaEnroll")
	public String insertQna(
			Qna q,
			HttpSession session,
			Model model,
			@ModelAttribute("loginUser") Member loginUser
			) {
		
		q.setBoardWriter(loginUser.getMemberNo()+"");
		
		
		int result = qnaService.insertQna(q);
		
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 작성 완료");
			return "redirect:/qnaList";
		}else {
			model.addAttribute("errorMsg","공지사항 작성 실패");
			return "common/errorPage";
		}
		
		
	}
	
	// 리스트에서 상세페이지 이동 , 조회수 증가
	@GetMapping("/qnaDetail/{boardNo}")
	public String selectNotice(
			@PathVariable("boardNo") int boardNo,
			HttpSession session,
			Model model,
			HttpServletRequest req,
			HttpServletResponse res
			) {
		
		QnaExt qna = qnaService.selectQna(boardNo);
		
		
		String url = "";
		
		model.addAttribute("qna", qna);
		log.info("모델에 잘 들어갔? ={}", qna);
		
		url = "qna/qnaDetailView";
		
		if(qna != null) {
			
			
			String memberId = "";
			Member loginUser = (Member) session.getAttribute("loginUser");
			if(loginUser != null) {
				memberId = loginUser.getMemberId();
			}
			
			// 게시글의 작성자의 아이디와 현재 세션의 접속중인 아이디가 같지 않을 경우에만 조회수 증가
			if(!qna.getBoardWriter().equals(memberId)) {
				
				
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
					
					cookie = new Cookie("readBoardNo", boardNo + ""); 
					
					result = qnaService.increaseCount(boardNo);
				}else { 
					
					String[] arr = cookie.getValue().split("/");
					
					
					List<String> list = Arrays.asList(arr);
					
					if(list.indexOf(boardNo + "") == -1) { 
						
						cookie.setValue(cookie.getValue()+"/"+boardNo);
						result = qnaService.increaseCount(boardNo); 
					}
					
				}
				
				if(result > 0) { 
					qna.setBoardCount(qna.getBoardCount()+1);
					
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
	
	// qna 수정하기로 이동
	@GetMapping("/qnaUpdate/{boardNo}")
	public String updateQna(
			@PathVariable("boardNo") int boardNo,
			Model model) {
		
		Qna qna = qnaService.selectQna(boardNo);
		qna.setBoardContent(Utils.newLineClear(qna.getBoardContent()));
		model.addAttribute("qna",qna);
		
		return "qna/qnaUpdateForm";
		
	}
	
	
	// qna 수정하기 (update)
	@PostMapping("/qnaUpdate/{boardNo}")
	public String qnaUpdate(
			Qna q,
			@PathVariable("boardNo") int boardNo,
			Model model, HttpSession session
			) {
		
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		q.setBoardWriter(loginUser.getMemberNo()+"");
		q.setBoardNo(boardNo);
		
		log.info("qna수정 확인 ! ==== {}", q);
		
		
		int result = 0;
		
		
		result = qnaService.updateQna(q);
		
		
		log.info("qna수정 = {}",q);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 수정 완료");
			return "redirect:/qnaDetail/"+boardNo;
		}else {
			model.addAttribute("errorMsg","게시글 수정 실패");
			return "common/errorPage";
		}
		
		
		
	}
	
	
	
	// qna 삭제하기
	@GetMapping("/deleteQna/{boardNo}")
	public String deleteQna(
			@PathVariable("boardNo") int boardNo, 
			HttpSession session, Model model
			) {
		
		int result = qnaService.deleteQna(boardNo);
	    if (result > 0) {
	        session.setAttribute("alertMsg", "게시글 삭제 완료");
	        return "redirect:/qnaList";
	    } else {
	        model.addAttribute("errorMsg", "게시글 삭제 실패");
	        return "common/errorPage";
	    }
	}
	
	
	// qna 리스트 삭제 (체크박스)
	@RequestMapping(value = "/deleteQnaList")
	public String deleteCheck(HttpServletRequest request) {
		
		
	   String[] ajaxMsg = request.getParameterValues("valueArr");
	   int size = ajaxMsg.length;
	   
	   for(int i = 0; i<size; i++) {
		   qnaService.deleteCheck(ajaxMsg[i]);
	   }
	   
	   return "redirect:qnaList";
	    
	}
	
	
	
	// 댓글작성
	@GetMapping("/insertReply")
	@ResponseBody
	public int insertReply(Reply r, HttpSession session) {
	    Member m = (Member) session.getAttribute("loginUser");
	    if (m != null) {
	        r.setReplyWriter(m.getMemberNo() + "");
	    }
	    
	    int result = 0;
	    try {
	        result = qnaService.insertReply(r);
	    } catch (DataIntegrityViolationException e) {
	        return -1; 
	    }

	    return result;
	}

	
	// 댓글 조회
	@GetMapping("/selectReplyList")
	@ResponseBody
	public List<Reply> selectReplyList(int bno){
		
		return qnaService.selectReplyList(bno);
	}
	
	// 댓글 수정
	@PostMapping("/updateReply")
	@ResponseBody
	public int updateReply(Reply reply) {
	    // replyNo와 editedContent는 AJAX 요청에서 전달된 값입니다.
	    
	    // 댓글 업데이트 로직을 수행합니다. 이 로직은 qnaService에서 처리할 것으로 가정합니다.
	    int result = qnaService.updateReply(reply);
	    
	    return result;
	}
	
	// 댓글 삭제
	@PostMapping("/deleteReply")
	@ResponseBody
	public int deleteReply(@RequestParam("replyNo") int replyNo) {
	    // replyNo를 이용하여 댓글 삭제 로직을 수행합니다.
	    int result = qnaService.deleteReply(replyNo);

	    return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
