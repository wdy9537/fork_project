package com.fork.user.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fork.user.management.model.service.ManagementService;
import com.fork.user.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class LicenseInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private ManagementService mService;
	
	/*
	 * @Override
	 
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView modelAndView) throws IOException {

		HttpSession session = req.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
			
		int result = mService.checkLicense(loginUser.getMemberNo());
		
		log.info("리절트 : " + result);
		log.info("session : " + session.getAttribute("flag"));
		
		if(result == 0 && session.getAttribute("flag") == null) { 
			res.sendRedirect(req.getContextPath()+"/license");
			session.setAttribute("flag", "flag");
			session.setAttribute("alertMsg", "이용권 구매 후 이용해주세요.");
			log.info("실패");
		}
		
	}
	*/
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws IOException {

		HttpSession session = req.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int result = mService.checkLicense(loginUser.getMemberNo());
		
		if( result == 0 ) { 
			res.sendRedirect(req.getContextPath()+"/license");
			session.setAttribute("alertMsg", "이용권 구매 후 이용해주세요.");
			return false;
		} else {
			return true;
		}
		
	}
	
}
