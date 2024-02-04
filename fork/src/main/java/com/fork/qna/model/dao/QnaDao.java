package com.fork.qna.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.qna.model.vo.Qna;
import com.fork.qna.model.vo.QnaExt;
import com.fork.qna.model.vo.Reply;

@Repository
public class QnaDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<Qna> selectList(int currentPage, Map<String, Object> paramMap) {
		
		int offset = (currentPage-1)*10;
		int limit = 10;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("qnaMapper.selectList", paramMap, rowBounds);
	}

	public int selectListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("qnaMapper.selectListCount", paramMap);
	}

	public int insertQna(Qna q) {
		return sqlSession.insert("qnaMapper.insertQna", q);
	}

	public QnaExt selectQna(int boardNo) {
		return sqlSession.selectOne("qnaMapper.selectQna", boardNo);
	}

	public int increaseCount(int boardNo) {
		return sqlSession.update("qnaMapper.increaseCount", boardNo);
	}

	public int updateQna(Qna q) {
		return sqlSession.update("qnaMapper.updateQna", q);
	}
	
	public int insertReply(Reply r) {
		return sqlSession.insert("qnaMapper.insertReply", r);
	}

	public List<Reply> selectReplyList(int bno) {
		return sqlSession.selectList("qnaMapper.selectReplyList", bno);
	}

	public int deleteQna(int boardNo) {
		return sqlSession.delete("qnaMapper.deleteQna", boardNo);
	}

	public Object deleteCheck(String no) {
		return sqlSession.delete("qnaMapper.deleteQnaList", no);
	}

	public int updateReply(Reply reply) {
		return sqlSession.update("qnaMapper.updateReply", reply);
	}

	public int deleteReply(int replyNo) {
		return sqlSession.delete("qnaMapper.deleteReply", replyNo);
	}

	public int deleteShopReply(int memberNo) {
		return sqlSession.delete("qnaMapper.deleteShopReply", memberNo);
	}


}
