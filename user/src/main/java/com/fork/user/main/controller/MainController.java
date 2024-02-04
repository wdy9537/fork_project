package com.fork.user.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fork.user.common.template.Pagenation;
import com.fork.user.common.vo.PageInfo;
import com.fork.user.management.model.service.ManagementService;
import com.fork.user.member.model.vo.Member;
import com.fork.user.notice.model.service.NoticeService;
import com.fork.user.notice.model.vo.Notice;
import com.fork.user.sales.model.service.SalesService;
import com.fork.user.sales.model.vo.Receipt;
import com.fork.user.sales.model.vo.Structure;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {


	@Autowired
    private NoticeService noticeService;
	
    @Autowired
    private SalesService salesService;
    
    @Autowired
	private ManagementService mService;
    
    @GetMapping(value = {"/", "/main"})
    public String goMain(Model model, HttpServletRequest req) {
    	HttpSession session = req.getSession();
    	
    	int currentPage = 1;
        List<Notice> list = selectNoticeList(1);
        
        // 총 게시글 갯수
        int total = noticeService.selectListCount();
        int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = Pagenation.getPageInfo(total, 1, pageLimit, boardLimit);
        
		session.setAttribute("list", list);
		session.setAttribute("pi", pi);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int result = mService.checkLicense(loginUser.getMemberNo());
		
		if( result == 0 ) { 
			session.setAttribute("licenseYN", 0);
		} else {
			session.setAttribute("licenseYN", 1);
		}
		
		return "main";
    }
    
    @GetMapping("/selectNotice")
    @ResponseBody
    public List<Notice> selectNoticeList(int currentPage){
    	List<Notice> list = noticeService.selectNoticeList(currentPage);

    	return list;
    }

    @GetMapping("/salesReady")
    public String toSlaesReady(Model model) {
        List<Structure> structureList = salesService.selectStructureList();
        List<Receipt> orderList = salesService.selectOrderList();
        
        model.addAttribute("structureList", structureList);
        model.addAttribute("orderList", orderList);

        return "sales/ready";
    }

    @GetMapping("/salesSetting")
    public String toSlaesSetting(Model model) {
        List<Structure> structureList = salesService.selectStructureList();
        model.addAttribute("structureList", structureList);

        return "sales/setting";
    }
    
    @GetMapping("/statistics")
    public String toStatistics() {
        return "chart/statistics";
    }
    
    
    
}
