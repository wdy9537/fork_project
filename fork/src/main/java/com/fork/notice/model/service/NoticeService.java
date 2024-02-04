package com.fork.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.fork.notice.model.vo.Attachment;
import com.fork.notice.model.vo.Notice;
import com.fork.notice.model.vo.NoticeExt;

public interface NoticeService {
	// 공지사항 리스트 조회
	public List<Notice> selectList(int currentPage, Map<String, Object> paramMap);
	
	// 공지사항 리스트 갯수 조회 (페이징 처리)
	public int selectListCount(Map<String, Object> paramMap);
	
	// 공지사항 작성
	int insertNotice(Notice n, List<Attachment> attachList, String severFolderPath, String webPath) throws Exception;
	
	// 공지사항 상세보기
	public NoticeExt selectNotice(int noticeNo);
	
	// 조회수 증가!
	int increaseCount(int noticeNo);

	// 첨부파일 저장
	public Attachment selectAttachment(int faNo);
	
	// 공지사항 수정
	public int updateNotice(Notice n, List<MultipartFile> upfiles, String severFolderPath, String webPath) throws Exception;

	// 공지사항 수정시 파일 삭제
	int deleteAttachmentsByNoticeNo(int noticeNo);
	
	// 공지사항 삭제
	public int deleteNotice(int noticeNo);

	// 선택삭제
	public void deleteCheck(String no);

	





}
