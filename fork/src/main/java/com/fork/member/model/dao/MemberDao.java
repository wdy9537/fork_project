package com.fork.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 로그인
	public Member loginUser(Member m ) {
		log.info("다오다오dao {}", m);
		return sqlSession.selectOne("memberMapper.loginUser", m);
	}
	// 가입승인 리스트 불러오기
	public List<Member> selectList() {
		return sqlSession.selectList("memberMapper.selectList");
	}
	
	// 가입승인 승인 (member status = 'Y' 로 update)
	public int approveMember(int memberNo) {
		return sqlSession.update("memberMapper.approveMember", memberNo);
	}
	
	// 가입승인 거절 (member delete)
	public int rejectMember(int memberNo) {
		return sqlSession.update("memberMapper.rejectMember", memberNo);
	}
	
	// 가입현황 list 불러오기
	public List<Member> selectShopList() {
		return sqlSession.selectList("memberMapper.selectShopList");
	}
	
	public Member selectShop(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectShop", memberNo);
	}
	
	public Object deleteCheck(String no) {
		return sqlSession.delete("memberMapper.deleteCheck", no);
	}
	public int deleteShop(int memberNo) {
		return sqlSession.delete("memberMapper.deleteShop", memberNo);
	}
	
}
