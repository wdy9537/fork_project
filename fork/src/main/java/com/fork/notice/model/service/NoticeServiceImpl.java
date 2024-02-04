package com.fork.notice.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fork.common.Utils;
import com.fork.notice.model.dao.NoticeDao;
import com.fork.notice.model.vo.Attachment;
import com.fork.notice.model.vo.Notice;
import com.fork.notice.model.vo.NoticeExt;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao; 
	
	// 공지사항 리스트 불러오기
	public List<Notice> selectList(int currentPage, Map<String, Object> paramMap){
		return noticeDao.selectList(currentPage, paramMap);
	}
	
	// 공지사항 리스트 페이지처리용 listCount
	public int selectListCount(Map<String, Object> paramMap) {
		return noticeDao.selectListCount(paramMap);
	}
	
	// 공지사항 작성하기
	@Transactional(rollbackFor = {Exception.class}) // 예외발생시 무조건 rollback
	@Override
	public int insertNotice(Notice n, List<Attachment> attachList, String severFolderPath, String webPath) throws Exception {
		
		n.setNoticeTitle(Utils.XSShandling(n.getNoticeTitle()));
		n.setNoticeContent(Utils.XSShandling(n.getNoticeContent()));
		n.setNoticeContent(Utils.newLineHandling(n.getNoticeContent()));
		
		int noticeNo = noticeDao.insertNotice(n);
		
		
		int result = 0;
		if(noticeNo > 0 && !attachList.isEmpty()) {
			for(Attachment attach: attachList) {
				attach.setRefNno(noticeNo);
				attach.setFaPath(webPath);
			}
			result = noticeDao.insertAttachmentList(attachList);
			
			if(result != attachList.size()) { // 이미지 삽입 실패시 강제 예외 발생
				throw new Exception("예외발생");
			}
		}
		
		
		return result;
	}
	
	
	
	// 공지사항 상세보기
	@Override
	public NoticeExt selectNotice(int noticeNo) {
		
		return noticeDao.selectNotice(noticeNo);
	}
	
	// 조회수 증가
	@Override
	public int increaseCount(int noticeNo) {
		
		return noticeDao.increaseCount(noticeNo);
	}

	// 파일다운
	@Override
	public Attachment selectAttachment(int faNo) {
		
		return noticeDao.selectAttachment(faNo);
	}
	
	public int insertAttachment(Attachment attach) {
		return noticeDao.insertAttachment(attach);
	}
	
	
	// 공지사항 수정
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateNotice(Notice n, List<MultipartFile> upfiles, String severFolderPath, String webPath) throws Exception{
		
		n.setNoticeTitle(Utils.XSShandling(n.getNoticeTitle()));
		n.setNoticeContent(Utils.XSShandling(n.getNoticeContent()));
		n.setNoticeContent(Utils.XSShandling(n.getNoticeContent()));
		
		int result = noticeDao.updateNotice(n);
		
		List<Attachment> attachList = new ArrayList();

		// 파일 추가
	    if (upfiles != null) {
	        for (MultipartFile upfile : upfiles) {
	            if (!upfile.isEmpty()) {
	                String changeName = Utils.saveFile(upfile, severFolderPath);
	                Attachment at = Attachment.builder()
	                    .refNno(n.getNoticeNo())
	                    .faOriginName(upfile.getOriginalFilename())
	                    .faChangeName(changeName)
	                    .faPath(webPath)
	                    .build();
	                attachList.add(at);
	            }
	        }
	    }

	    // 새로운 파일 추가
	    if (!attachList.isEmpty()) {
	        noticeDao.insertAttachmentList(attachList);
	    }
		
		return result;
	}
	
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int deleteAttachmentsByNoticeNo(int noticeNo) {
	    return noticeDao.deleteAttachmentByNoticeNo(noticeNo);
	}

	
	
	
	// 공지사항 삭제
	@Override
	public int deleteNotice(int noticeNo) {
		
	   return noticeDao.deleteNotice(noticeNo);
	}


	@Override
	public void deleteCheck(String no) {
		noticeDao.deleteCheck(no);
	}

	

	

	

	



	

	

	

	
	
	
	
	
	
	
	
}
