package com.izo.itaportal.repository;

import com.izo.itaportal.model.Notice;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface NoticeRepository {

    List<Notice> findAllNotice();

    Notice findNoticeById(int idNotice);

    void insertNotice(Notice notice);

    void updateNotice(Notice notice);

    void deleteNotice(int idNotice);

    // 공지사항 검색 기능 추가
    List<Notice> searchNoticesByKeyword(@Param("keyword") String keyword);

    // 공지사항 페이지 이동 기능 추가
    List<Notice> findNoticesByPage(@Param("offset") int offset, @Param("limit") int limit);
    int countAllNotices();
}