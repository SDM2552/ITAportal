////package com.izo.itaportal.repository;
////
////import com.izo.itaportal.model.User;
////import com.izo.itaportal.model.Notice;
////import org.apache.ibatis.annotations.*;
////
////@Mapper
////public interface StepRepository {
////
////    //사용자추가
////    @Insert("INSERT INTO users (loginId, password, role, registDate) VALUES (#{loginId}, #{password}, #{role}, NOW())")
////    void insertStaff(User user);
////
////    //사용자조회
////    @Select("SELECT * FROM users WHERE loginId = #{loginId} AND password = #{password}")
////    User findUserByLoginIdAndPassword(String loginId, String password);
////
////    //공지사항추가
////    @Insert("INSERT INTO notices (title, content, datePosted) VALUES (#{title}, #{content}, NOW())")
////    void insertNotice(Notice notice);
////
////    //공지사항수정
////    @Update("UPDATE notices SET title = #{title}, content = #{content} WHERE idNotice = #{idNotice}")
////    void updateNotice(@Param("idNotice") int idNotice, @Param("title") String title, @Param("content") String content);
////
////    //공지사항아이디로 중복오류확인
////    @Select("SELECT * FROM notices WHERE idNotice = #{idNotice}")
////    Notice findNoticeById(int idNotice);
////
////    //공지사항삭제
////    @Delete("DELETE FROM notices WHERE idNotice = #{idNotice}")
////    void deleteNotice(int idNotice);
////}
//
//package com.izo.itaportal.repository;
//
//import com.izo.itaportal.model.User;
//import com.izo.itaportal.model.Notice;
//import org.apache.ibatis.annotations.Mapper;
//import org.apache.ibatis.annotations.Param;
//
//@Mapper
//public interface StepRepository {
//    void insertStaff(User user);
//
//    User findUserByLoginIdAndPassword(@Param("loginId") String loginId, @Param("password") String password);
//
//    void insertNotice(Notice notice);
//
//    void updateNotice(@Param("idNotice") int idNotice, @Param("title") String title, @Param("content") String content);
//
//    Notice findNoticeById(int idNotice);
//
//    void deleteNotice(int idNotice);
//}