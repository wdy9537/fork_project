package com.fork.member.model.service;

import java.util.List;

import com.fork.member.model.vo.Member;


public interface MemberService {

	// 로그인
	public Member loginUser(Member m);
	
	// 가입승인 리스트 불러오기
	public List<Member> selectList();
	
	// 가입승인 승인하기 (update status = 'Y')
	public int approveMember(int memberNo);
	
	// 가입승인 거절하기 (member 삭제)
	public int rejectMember(int memberNo);
	
	// 가입현황 list불러오기
	public List<Member> selectShopList();

	public Member selectShop(int memberNo);

	public void deleteCheck(String no);

	public int deleteShop(int memberNo);

	
	
	

}
