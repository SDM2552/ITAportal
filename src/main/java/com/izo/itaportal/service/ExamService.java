package com.izo.itaportal.service;

import com.izo.itaportal.dto.ExamDetailDto;
import com.izo.itaportal.dto.ExamListDto;
import com.izo.itaportal.dto.GetProgNameDto;
import com.izo.itaportal.model.Exam;
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
    public ExamDetailDto getExamDetail(int idExam) {
        return examRepository.getExamDetail(idExam);
    }
    public List<GetProgNameDto> getProgNameDtos(int idProf){
        return examRepository.GetProgNameById(idProf);
    }
    public void insertExam(Exam exam){
        examRepository.insertExam(exam);
    }
    public List<ExamListDto> getExamsByStudentId(int idStudent){
        return examRepository.getExamsByStudentId(idStudent);
    }
    public void incrementCount(int idExam) {
        examRepository.incrementCount(idExam);
    }

}
