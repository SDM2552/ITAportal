package com.izo.itaportal.service;

import com.izo.itaportal.dto.SugangDto;
import com.izo.itaportal.model.Student;

import com.izo.itaportal.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {
    @Autowired
    private StudentRepository studentRepository;


    public List<Student> getAllStudents(){
        return studentRepository.findAll();
    }

    public List<SugangDto> GetSugangList(int idStudent){
        return studentRepository.findByIdStudent(idStudent);
    }


    //어드민-신청중-신청대기-신청취소
    public Student getStudentByIdUser(int idUser) {
        return studentRepository.findStudentByIdUser(idUser);
    }
}
