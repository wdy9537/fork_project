package com.fork.user.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.user.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
@RequiredArgsConstructor
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertMemeber(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member login(Member m) {
		return sqlSession.selectOne("memberMapper.login", m);
	}

	public Member selectId(Member m) {
		return sqlSession.selectOne("memberMapper.selectId", m);
	}
	
	public Member selectPwd(Member m) {
		return sqlSession.selectOne("memberMapper.selectPwd", m);
	}

	public void updateNumber(Member m) {
		sqlSession.update("memberMapper.updateNumber", m);
	}

	public int idcheck(String memberId) {
		try {
	        Integer result = sqlSession.selectOne("memberMapper.idcheck", memberId);
	        return (result != null) ? result : 0;
	    } catch (NullPointerException e) {
	        return 0;
	    }
	}

	public Member checkNumber(Member m) {
		return sqlSession.selectOne("memberMapper.checkNumber", m);
	}

	public int changePwd(Member m) {
		return sqlSession.update("memberMapper.changePwd", m);
	}

	public Member selectShop(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectShop", memberNo);
	}

}
