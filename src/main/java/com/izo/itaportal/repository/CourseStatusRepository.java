package com.izo.itaportal.repository;

import com.izo.itaportal.model.Program;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CourseStatusRepository {


    // 프로그램 정보 불러오기
    public Program selectProgramByIdPgm(int idPgm);

}

