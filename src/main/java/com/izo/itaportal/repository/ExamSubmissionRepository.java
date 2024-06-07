package com.izo.itaportal.repository;

import com.izo.itaportal.dto.ExamSubmitDataDto;
import com.izo.itaportal.model.ExamSubmission;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ExamSubmissionRepository {
    void saveExamSubmission(ExamSubmission examSubmission);

    ExamSubmission getExamSubmission(Integer idSubmission);
    List<ExamSubmitDataDto> getExamSubmitData(@Param("idExam") int idExam, @Param("idProgram") int idProgram);

}


