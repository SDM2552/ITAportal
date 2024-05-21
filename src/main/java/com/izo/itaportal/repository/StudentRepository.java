package com.izo.itaportal.repository;

import com.izo.itaportal.dto.SugangDto;
import com.izo.itaportal.model.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface StudentRepository {
    @Select("SELECT * FROM student")
    List<Student> findAll();

    //idStudent로 수강내역 조회
    public List<SugangDto> findByIdStudent(int idStudent);


    //어드민 수강신청취소대기완료
    @Select("SELECT * FROM student WHERE id_user = #{idUser}")
    Student findStudentByIdUser(int idUser);
}
