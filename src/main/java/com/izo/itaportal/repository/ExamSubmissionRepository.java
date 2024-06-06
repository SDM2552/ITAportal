package com.izo.itaportal.repository;

import com.izo.itaportal.model.ExamSubmission;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ExamSubmissionRepository {
    void saveExamSubmission(ExamSubmission examSubmission);

    ExamSubmission getExamSubmission(Integer idSubmission);
}


