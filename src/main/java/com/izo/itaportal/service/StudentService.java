package com.izo.itaportal.service;

import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.dto.StudentInfoDto;
import com.izo.itaportal.dto.SugangDto;
import com.izo.itaportal.model.Student;

import com.izo.itaportal.repository.StudentRepository;
import com.izo.itaportal.repository.SugangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {
    @Autowired
    private StudentRepository studentRepository;
    @Autowired
    private SugangRepository sugangRepository;


    public List<Student> getAllStudents(){
        return studentRepository.findAll();
    }

//    public List<SugangDto> GetSugangList(int idStudent){
//
//        return studentRepository.findByIdStudent(idStudent);
//    }
//    public List<SugangDto> GetCourceList(int idStudent){
//        return sugangRepository.findByIdStudentAndCourseStatus(idStudent);
//    }
    //강사중복오류
public List<SugangDto> GetSugangList(int idStudent) {
    List<SugangDto> sugangList = studentRepository.findByIdStudent(idStudent);
    for (SugangDto sugang : sugangList) {
        List<ProgramAllDto> professors = studentRepository.findProfessorsByProgramId(sugang.getIdPgm());
        sugang.setProfessors(professors);
    }
    return sugangList;
}

    public List<SugangDto> GetCourceList(int idStudent) {
        List<SugangDto> sugangList = sugangRepository.findByIdStudentAndCourseStatus(idStudent);
        for (SugangDto sugang : sugangList) {
            List<ProgramAllDto> professors = studentRepository.findProfessorsByProgramId(sugang.getIdPgm());
            sugang.setProfessors(professors);
        }
        return sugangList;
    }

    //로그인한 학생의 신상정보 가져오기
    public StudentInfoDto getStudentInfo(int idUser){
        return studentRepository.findStudentInfoByIdUser(idUser);
    }

    //어드민-신청중-신청대기-신청취소
    public Student getStudentByIdUser(int idUser) {
        return studentRepository.findStudentByIdUser(idUser);
    }


    //수업디테일,강사디테일
    // 프로그램 상세 조회
    public ProgramAllDto getProgramById(int id) {
        return studentRepository.findProgramById(id);
    }

    // 학생의 모든 프로그램 조회
    public List<ProgramAllDto> getProfessorsByProgramId(int id) {
        return studentRepository.findProfessorsByProgramId(id);
    }

    public List<ProgramAllDto> getStudentPrograms(int idStudent) {
        return studentRepository.findProgramsByStudentId(idStudent);
    }
}
