package com.izo.itaportal.repository;

import com.izo.itaportal.dto.ExamDetailDto;
import com.izo.itaportal.dto.ExamListDto;
import com.izo.itaportal.dto.GetProgNameDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ExamRepository {

    //해당 교수가 낸 과제 리스트
    List<ExamListDto> getExamListByProfessor(@Param("idProf") int idProf);

    //과제 상세
    ExamDetailDto getExamDetail(@Param("idPgm") int idPgm, @Param("idProf") int idProf);

    List<GetProgNameDto> GetProgNameById(int idProf);
}
