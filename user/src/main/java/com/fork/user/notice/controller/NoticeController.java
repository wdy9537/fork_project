package com.fork.user.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fork.user.notice.model.service.NoticeService;
import com.fork.user.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
// @RequestMapping("/notice") // 공통주소
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;

	@GetMapping("/choice")
	public String choice(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		List<Notice> list = noticeService.selectNoticeList(currentPage);
		model.addAttribute("list", list);
		return "choice";
	}
	
	@GetMapping("/noticeDetail/{nno}")
	@ResponseBody
	public Notice noticeDetailView(Model model, @PathVariable("nno") int nno) {
		Notice n = noticeService.noticeDetailView(nno);
		return n;
	}
	
}
