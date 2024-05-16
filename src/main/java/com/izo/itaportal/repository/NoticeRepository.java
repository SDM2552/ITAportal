package com.izo.itaportal.repository;
import org.apache.ibatis.annotations.Mapper;
import com.izo.itaportal.model.Notice;
import java.util.List;

@Mapper
public interface NoticeRepository {

    List<Notice> findAllNotices();

    Notice findNoticeById(int idNotice);

    void insertNotice(Notice notice);

    void updateNotice(Notice notice);

    void deleteNotice(int idNotice);
}