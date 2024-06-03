package com.izo.itaportal.service;

import com.izo.itaportal.model.*;
import com.izo.itaportal.repository.AdminRepository;
import com.izo.itaportal.repository.MyPageRepository;
import com.izo.itaportal.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class MyPageService {

    @Autowired
    MyPageRepository myPageRepository;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserRepository userRepository;

    public Student getStudentById(Integer idUser) {
        return myPageRepository.selectStudentById(idUser);
    }

    public Professor getProfessorById(Integer idUser) {
        return myPageRepository.selectProfById(idUser);
    }

    public Admin getAdminById(Integer idUser) {
        return myPageRepository.selectAdminById(idUser);
    }

    public User getUserById(Integer idUser) {
        return myPageRepository.selectUserById(idUser);
    }

    public int updateStudent(SignUpRequest signUpRequest) {
        int updateStudent = myPageRepository.updateStudent(signUpRequest);
        return updateStudent;
    }

    public int updateProfessor(SignUpRequest signUpRequest) {
        int updateProfessor = myPageRepository.updateProf(signUpRequest);
        return updateProfessor;
    }

    public int updateAdmin(SignUpRequest signUpRequest) {
        int updateAdmin = myPageRepository.updateAdmin(signUpRequest);
        return updateAdmin;
    }

    public int updateEmail(SignUpRequest signUpRequest) {
        int updateEmail = myPageRepository.updateEmail(signUpRequest);
        return updateEmail;
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

    public int deleteUser(Integer idUser) {
        int deleteUser = myPageRepository.deleteUser(idUser);
        return deleteUser;
    }

    public boolean deleteUser1(Integer idUser) {
        return myPageRepository.deleteUser(idUser) > 0;
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

    public boolean updatePassword(Integer idUser, String newPassword) {
        User user = myPageRepository.selectUserById(idUser);
        if (user == null) {
            return false;
        }

        String encryptedNewPassword = passwordEncoder.encode(newPassword);
        myPageRepository.updatePassword(idUser, encryptedNewPassword);
        return true;
    }

    public boolean verifyPassword(Integer idUser, String password) {
        // 이 메서드는 사용자의 비밀번호가 맞는지 확인하는 로직을 구현합니다.
        // 예시로, 데이터베이스에서 사용자 정보를 조회하여 비밀번호를 비교하는 로직을 작성합니다.
        User user = myPageRepository.selectUserById(idUser);
        return user != null && passwordEncoder.matches(password, user.getPassword());


    }
}