package com.fork.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fork.member.model.dao.MemberDao;
import com.fork.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member loginUser(Member m) {
		
		Member loginUser = memberDao.loginUser(m);
		
		return loginUser;
		
	}

	@Override
	public List<Member> selectList() {
		return memberDao.selectList();
	}

	@Override
	public int approveMember(int memberNo) {
		return memberDao.approveMember(memberNo);
	}

	@Override
	public int rejectMember(int memberNo) {
		return memberDao.rejectMember(memberNo);
	}

	@Override
	public List<Member> selectShopList() {
		return memberDao.selectShopList();
	}

	@Override
	public Member selectShop(int memberNo) {
		return memberDao.selectShop(memberNo);
	}

	@Override
	public void deleteCheck(String no) {
		memberDao.deleteCheck(no);
	}

	@Override
	public int deleteShop(int memberNo) {
		return memberDao.deleteShop(memberNo);
	}
}
