package com.fork.user.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.user.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Notice> selectNoticeList(int currentPage) {
		int limit = 5 ;
		int offset = ( currentPage - 1 ) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
	}

	public Notice noticeDetailView(int nno) {
		return sqlSession.selectOne("noticeMapper.noticeDetailView", nno);
	}

	public int selectListCount() {
		
		
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}

}

