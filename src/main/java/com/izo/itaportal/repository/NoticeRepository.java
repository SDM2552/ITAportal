package com.izo.itaportal.repository;

import com.izo.itaportal.model.Notice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeRepository {

    List<Notice> findAllNotice();

    Notice findNoticeById(int idNotice);

    void insertNotice(Notice notice);

    void updateNotice(Notice notice);

    void deleteNotice(int idNotice);
}