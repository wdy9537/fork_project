package com.fork.user.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.fork.user.member.model.dao.MemberDao;
import com.fork.user.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	private static final String senderEmail= "wjdehd444@gmail.com";
	
	private int number;

	@Override
	public int insertMember(Member m) {
		return memberDao.insertMemeber(m);
	}

	@Override
	public Member login(Member m) {
		return memberDao.login(m);
	}

	@Override
	public Member selectId(Member m) {
		return memberDao.selectId(m);
	}
	
	@Override
	public Member selectPwd(Member m) {
		return memberDao.selectPwd(m);
	}

	public void createNumber(){
	       number = (int)(Math.random() * (900)) + 1000;// (int) Math.random() * (최댓값-최소값+1) + 최소값
	}
	
	@Override
	public void sendEmail(Member m) {
		
		createNumber();
		
		SimpleMailMessage message = new SimpleMailMessage();
		 
        message.setTo(m.getEmail());
        message.setFrom(senderEmail);
        message.setSubject("Fork 이메일 인증");
        message.setText("인증번호는 " + number +" 입니다.");

        javaMailSender.send(message);
        
        m.setExtraNumber(number);
        
        memberDao.updateNumber(m);
		
	}

	@Override
	public Member checkNumber(Member m) {
		return memberDao.checkNumber(m);
	}

	@Override
	public int changePwd(Member m) {
		return memberDao.changePwd(m);
	}

	@Override
	public int idcheck(String memberId) {
		return memberDao.idcheck(memberId);
	}

	@Override
	public Member selectShop(int memberNo) {
		return memberDao.selectShop(memberNo);
	}
	
}
