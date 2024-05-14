package com.izo.itaportal.repository;

import com.izo.itaportal.model.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface StudentRepository {
    @Select("SELECT * FROM student")
    List<Student> findAll();

}
