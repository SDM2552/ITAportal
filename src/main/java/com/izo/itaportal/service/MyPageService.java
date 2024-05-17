package com.izo.itaportal.service;

import com.izo.itaportal.model.Admin;
import com.izo.itaportal.model.Professor;
import com.izo.itaportal.model.Student;
import com.izo.itaportal.repository.AdminRepository;
import com.izo.itaportal.repository.MyPageRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class MyPageService {

    @Autowired
    MyPageRepository myPageRepository;

    public Student getStudentById(Integer idUser) {
        return myPageRepository.selectStudentById(idUser);
    }

    public Professor getProfessorById(Integer idUser) {
        return myPageRepository.selectProfById(idUser);
    }

    public Admin getAdminById(Integer idUser) {
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

    public int deleteStudent(Integer idUser) {
        int deleteStudent = myPageRepository.deleteStudent(idUser);
        return deleteStudent;
    }

    public int deleteProfessor(Integer idUser) {
        int deleteProfessor = myPageRepository.deleteProf(idUser);
        return deleteProfessor;
    }

    public int deleteAdmin(Integer idUser) {
        int deleteAdmin = myPageRepository.deleteAdmin(idUser);
        return deleteAdmin;
    }

    public boolean isStudent(Integer idUser) {
        // idUser에 해당하는 사용자가 학생 테이블에 존재하는지 확인하는 로직
        // 예를 들어, Student 테이블에서 idUser를 조회하여 해당하는 사용자가 있는지 확인하는 방법을 사용할 수 있습니다.
        Student student = myPageRepository.selectStudentById(idUser);
        return student != null;
    }
    public boolean isProfessor(Integer idUser) {
        Professor professor = myPageRepository.selectProfById(idUser);
        boolean isProfessor = professor != null;
        log.debug("Is professor? {} for user id: {}", isProfessor, idUser);
        return isProfessor;
    }

    public boolean isAdmin(Integer idUser) {
        Admin admin = myPageRepository.selectAdminById(idUser);
        boolean isAdmin = admin != null;
        log.debug("Is admin? {} for user id: {}", isAdmin, idUser);
        return isAdmin;
    }


}