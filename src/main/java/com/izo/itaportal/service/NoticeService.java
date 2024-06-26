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
        notice.setViews(0);
        noticeRepository.insertNotice(notice);
    }

    public void updateNotice(int idNotice, Notice notice) {
        noticeRepository.updateNotice(notice);
    }

    public void deleteNotice(int idNotice) {
        noticeRepository.deleteNotice(idNotice);
    }

    public void incrementViews(int idNotice) {
        noticeRepository.incrementViews(idNotice);
    }

    public List<Notice> searchNoticesByKeyword(String keyword) {
        return noticeRepository.searchNoticesByKeyword(keyword);
    }

    public List<Notice> getNoticesByPage(int pageNum) {
        int limit = 10;
        int offset = (pageNum - 1) * limit;
        return noticeRepository.findNoticesByPage(offset, limit);
    }

    public List<Notice> getNoticesByPageWithKeyword(int pageNum, String keyword) {
        int limit = 10;
        int offset = (pageNum - 1) * limit;
        return noticeRepository.findNoticesByPageWithKeyword(offset, limit, keyword);
    }

    public int getTotalNotices() {
        return noticeRepository.countAllNotices();
    }

    public int getTotalNoticesByKeyword(String keyword) {
        return noticeRepository.countNoticesByKeyword(keyword);
    }

    public List<Notice> getLatestNotices() {
        return noticeRepository.findLatestNotices();
    }
}
