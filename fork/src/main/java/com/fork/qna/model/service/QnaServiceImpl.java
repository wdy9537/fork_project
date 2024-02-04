package com.fork.qna.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fork.qna.model.dao.QnaDao;
import com.fork.qna.model.vo.Qna;
import com.fork.qna.model.vo.QnaExt;
import com.fork.qna.model.vo.Reply;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao qnaDao;
	
	
	@Override
	public List<Qna> selectList(int currentPage, Map<String, Object> paramMap) {
		return qnaDao.selectList(currentPage, paramMap);
	}


	@Override
	public int selectListCount(Map<String, Object> paramMap) {
		return qnaDao.selectListCount(paramMap);
	}

	// qna 작성하기
	@Override
	public int insertQna(Qna q) {
		return qnaDao.insertQna(q);
	}

	// qna 상세보기
	@Override
	public QnaExt selectQna(int boardNo) {
		return qnaDao.selectQna(boardNo);
	}

	// 조회수 증가
	@Override
	public int increaseCount(int boardNo) {
		return qnaDao.increaseCount(boardNo);
	}
	
	// qna 수정
	@Override
	public int updateQna(Qna q) {
		return qnaDao.updateQna(q);
	}

	// 댓글 작성
	@Override
	public int insertReply(Reply r) {
		return qnaDao.insertReply(r);
	}

	// 댓글 조회
	@Override
	public List<Reply> selectReplyList(int bno) {
		return qnaDao.selectReplyList(bno);
	}


	@Override
	public int deleteQna(int boardNo) {
		return qnaDao.deleteQna(boardNo);
	}


	@Override
	public void deleteCheck(String no) {
		qnaDao.deleteCheck(no);
	}


	@Override
	public int updateReply(Reply reply) {
		return qnaDao.updateReply(reply);
	}


	@Override
	public int deleteReply(int replyNo) {
		return qnaDao.deleteReply(replyNo);
	}


	@Override
	public int deleteShopReply(int memberNo) {
		return qnaDao.deleteShopReply(memberNo);
	}


}
