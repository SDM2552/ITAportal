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

    //공지사항 검색 공지사항이동
    List<Notice> searchNoticesByKeyword(@Param("keyword") String keyword);

    List<Notice> findNoticesByPage(@Param("offset") int offset, @Param("limit") int limit);

    List<Notice> findNoticesByPageWithKeyword(@Param("offset") int offset, @Param("limit") int limit, @Param("keyword") String keyword);

    int countAllNotices();

    int countNoticesByKeyword(@Param("keyword") String keyword);
}