package com.izo.itaportal.repository;

import com.izo.itaportal.dto.ExamListDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ExamRepository {

    //해당 교수가 낸 과제 리스트
    List<ExamListDto> getExamListByProfessor(@Param("idProf") int idProf);
}
