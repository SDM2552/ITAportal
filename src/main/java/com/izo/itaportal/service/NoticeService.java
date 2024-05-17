package com.izo.itaportal.service;

import com.izo.itaportal.model.Notice;
import com.izo.itaportal.repository.NoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {

    @Autowired
    private NoticeRepository noticeRepository;

    public List<Notice> getAllNotices() {
        return noticeRepository.findAllNotice();
    }

    public Notice getNoticeById(int idNotice) {
        return noticeRepository.findNoticeById(idNotice);
    }

    public void createNotice(Notice notice) {
        noticeRepository.insertNotice(notice);
    }

    public void updateNotice(int idNotice, Notice notice) {
        Notice existingNotice = noticeRepository.findNoticeById(idNotice);
        notice.setViews(existingNotice.getViews());  // 기존 조회수 유지
        notice.setIdNotice(idNotice);
        noticeRepository.updateNotice(notice);
    }

    public void deleteNotice(int idNotice) {
        noticeRepository.deleteNotice(idNotice);
    }

    // 공지사항 검색 서비스 추가
    public List<Notice> searchNoticesByKeyword(String keyword) {
        return noticeRepository.searchNoticesByKeyword(keyword);
    }

    // 공지사항 페이지 이동 서비스 추가
    public List<Notice> getNoticesByPage(int pageNum) {
        int offset = (pageNum - 1) * 10;
        int limit = 10;
        return noticeRepository.findNoticesByPage(offset, limit);
    }
}