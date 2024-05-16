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

    public int updateStudent(Student student) {
        int updateStudent = myPageRepository.updateStudent(student);
        return updateStudent;
    }

    public int updateProfessor(Professor professor) {
        int updateProfessor = myPageRepository.updateProf(professor);
        return updateProfessor;
    }

    public int updateAdmin(Admin admin) {
        int updateAdmin = myPageRepository.updateAdmin(admin);
        return updateAdmin;
    }

    public int deleteStudent(int idUser) {
        int deleteStudent = myPageRepository.deleteStudent(idUser);
        return deleteStudent;
    }

    public int deleteProfessor(int idUser) {
        int deleteProfessor = myPageRepository.deleteProf(idUser);
        return deleteProfessor;
    }

    public int deleteAdmin(int idUser) {
        int deleteAdmin = myPageRepository.deleteAdmin(idUser);
        return deleteAdmin;
    }


}