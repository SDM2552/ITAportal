package com.izo.itaportal.service;

import com.izo.itaportal.model.Student;

import com.izo.itaportal.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/*
* 엔롤먼트서비스로 IdStudent
* */

@Service
public class StudentService {
    @Autowired
    private StudentRepository studentRepository;

    public List<Student> getAllStudents(){
        return studentRepository.findAll();
    }

    //엔롤먼트서비스로
    public Student getStudentById(int idStudent) {
        return studentRepository.findStudentById(idStudent);
    }
}
