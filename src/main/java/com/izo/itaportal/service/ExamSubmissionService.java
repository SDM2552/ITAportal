package com.izo.itaportal.service;

import com.izo.itaportal.model.ExamSubmission;
import com.izo.itaportal.repository.ExamSubmissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExamSubmissionService {
    @Autowired
    private ExamSubmissionRepository examSubmissionRepository;

    public void saveExamSubmission(ExamSubmission examSubmission) {
        examSubmissionRepository.saveExamSubmission(examSubmission);
    }
    public ExamSubmission getExamSubmission(Integer idSubmission) {
        return examSubmissionRepository.getExamSubmission(idSubmission);
    }
}
