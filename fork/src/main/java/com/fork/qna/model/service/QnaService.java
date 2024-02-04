package com.fork.qna.model.service;

import java.util.List;
import java.util.Map;


import com.fork.qna.model.vo.Qna;
import com.fork.qna.model.vo.QnaExt;
import com.fork.qna.model.vo.Reply;


public interface QnaService {
	
	// qna리스트 조회
	public List<Qna> selectList(int currentPage, Map<String, Object> paramMap);
	
	// qna리스트 갯수 조회 (페이징 처리)
	public int selectListCount(Map<String, Object> paramMap);
	
	// qna 작성
	public int insertQna(Qna q);
	
	// qna 상세보기
	public QnaExt selectQna(int boardNo);
	
	// 조회수증가
	public int increaseCount(int boardNo);
	
	// 댓글 작성
	public int insertReply(Reply r);
	
	// 댓글 조회
	public List<Reply> selectReplyList(int bno);
	
	// 댓글 수정
	public int updateReply(Reply reply);
	
	// 댓글 삭제
	public int deleteReply(int replyNo);
	
	// qna 수정
	public int updateQna(Qna q);
	
	// qna 삭제
	public int deleteQna(int boardNo);
	
	// qna 리스트 선택삭제
	public void deleteCheck(String no);

	// 가맹점 삭제할때 ..! 
	public int deleteShopReply(int memberNo);

	
	

}
