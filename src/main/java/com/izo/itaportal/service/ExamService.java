package com.izo.itaportal.service;

import com.izo.itaportal.dto.ExamListDto;
import com.izo.itaportal.repository.ExamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExamService {

    @Autowired
    private ExamRepository examRepository;

    public List<ExamListDto> getExamListByProfessor(int idProf) {
        return examRepository.getExamListByProfessor(idProf);
    }
}
