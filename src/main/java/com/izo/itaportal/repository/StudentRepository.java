package com.izo.itaportal.repository;

import com.izo.itaportal.model.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface StudentRepository {
    @Select("SELECT * FROM student")
    List<Student> findAll();

    //엔롤먼트서비스와 엔롤먼트리포지토리를 위함
    @Select("SELECT * FROM student WHERE id_student = #{idStudent}")
    Student findStudentById(int idStudent);
}
