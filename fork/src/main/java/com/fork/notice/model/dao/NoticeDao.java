package com.fork.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.notice.model.vo.Attachment;
import com.fork.notice.model.vo.Notice;
import com.fork.notice.model.vo.NoticeExt;




@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public List<Notice> selectList(int currentPage, Map<String, Object> paramMap){
		
		int offset = (currentPage-1)*10;
		int limit = 10;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("noticeMapper.selectList", paramMap, rowBounds);
	}


	
	public int selectListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("noticeMapper.selectListCount", paramMap);
	}

	
	// 공지사항 작성
	public int insertNotice(Notice n) {
		int result = 0;
		
		result = sqlSession.insert("noticeMapper.insertNotice", n);
		
		if(result > 0) {
			result = n.getNoticeNo();
		}
		
		return result;
	}
	
	// 공지사항 첨부파일 등록
	public int insertAttachmentList(List<Attachment> attachList) {
		return sqlSession.insert("noticeMapper.insertAttachmentList", attachList);
	}
	
	// 공지사항 상세보기
	public NoticeExt selectNotice(int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}

	// 조회수 증가
	public int increaseCount(int noticeNo) {
		return sqlSession.update("noticeMapper.increaseCount", noticeNo);
	}

	// 파일 다운
	public Attachment selectAttachment(int faNo) {
		return sqlSession.selectOne("noticeMapper.selectAttachment", faNo);
	}

	// 공지사항 수정
	public int updateNotice(Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}




	// 공지사항 수정 (파일수정)
	public int updateAttachment(Attachment at) {
		return sqlSession.update("noticeMapper.updateAttachment", at);
	}


	// 공지사항 수정 (파일등록)
	public int insertAttachment(Attachment attach) {
		return sqlSession.insert("noticeMapper.insertAttachment", attach);
	}

	// 공지사항 수정 (파일삭제)
	public int deleteAttachmentByNoticeNo(int noticeNo) {
		
		return sqlSession.delete("noticeMapper.deleteAttachment", noticeNo);
	}


	public int deleteNotice(int noticeNo) {
		
		return sqlSession.delete("noticeMapper.deleteNotice", noticeNo);
	}



	public Object deleteCheck(String no) {
		return sqlSession.delete("noticeMapper.deleteNoticeList", no);
	}



	











	

	

	
	
	
	
	
	
	
	
	
	
	
}
