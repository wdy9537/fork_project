package com.fork.user.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fork.user.notice.model.dao.NoticeDao;
import com.fork.user.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public List<Notice> selectNoticeList(int currentPage) {
		return noticeDao.selectNoticeList(currentPage);
	}

	@Override
	public Notice noticeDetailView(int nno) {
		return noticeDao.noticeDetailView(nno);
	}

	@Override
	public int selectListCount() {
		return noticeDao.selectListCount();
	}

}
