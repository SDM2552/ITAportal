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
        notice.setIdNotice(idNotice);
        noticeRepository.updateNotice(notice);
    }

    public void deleteNotice(int idNotice) {
        noticeRepository.deleteNotice(idNotice);
    }
}