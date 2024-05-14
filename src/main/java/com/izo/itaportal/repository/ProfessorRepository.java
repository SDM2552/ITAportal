package com.izo.itaportal.repository;

import com.izo.itaportal.model.Professor;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProfessorRepository {

    @Select("SELECT * FROM professor")
    List<Professor> findAll();
}
