package com.izo.itaportal.service;

import com.izo.itaportal.model.Admin;
import com.izo.itaportal.model.Professor;
import com.izo.itaportal.model.Student;
import com.izo.itaportal.repository.AdminRepository;
import com.izo.itaportal.repository.MyPageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyPageService {

    @Autowired
    MyPageRepository myPageRepository;

    public Student getStudentById(int idUser) {
        return myPageRepository.selectStudentById(idUser);
    }

    public Professor getProfessorById(int idUser) {
        return myPageRepository.selectProfById(idUser);
    }

    public Admin getAdminById(int idUser) {
        return myPageRepository.selectAdminById(idUser);
    }


}