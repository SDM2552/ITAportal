package com.izo.itaportal.service;

import com.izo.itaportal.model.*;
import com.izo.itaportal.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;
    @Autowired
    PasswordEncoder passwordEncoder;

    //학생 회원가입
    @Transactional
    public void insertStu(SignUpRequest signUpRequest){
        signUpRequest.setPassword(passwordEncoder.encode(signUpRequest.getPassword()));
        signUpRequest.setRole("stu");
        userRepository.insertUser(signUpRequest);
        String idUser = signUpRequest.getIdUser();
        userRepository.insertStu(signUpRequest);
    }

    //교수 회원가입
    @Transactional
    public void insertProf(SignUpRequest signUpRequest){
        signUpRequest.setPassword(passwordEncoder.encode(signUpRequest.getPassword()));
        userRepository.insertUser(signUpRequest);
        String idUser = signUpRequest.getIdUser();
        userRepository.insertProf(signUpRequest);
    }


    public LoginResponse loginCheck(LoginRequest loginReq) {

        LoginResponse user = userRepository.getUserByLoginId(loginReq.getLoginId());

        String encodedPassword = (user == null) ? "" : user.getPassword();

        if (user == null || passwordEncoder.matches(loginReq.getPassword(), encodedPassword) == false) {
            System.out.println("틀렷삼");
            return null;
        }
        System.out.println("됏삼");
        return user;
    }

    // 유저 중복 확인
    public boolean isLoginIdDuplicate(String loginId) {
        return userRepository.countByLoginId(loginId) != 0;
    }

    //학생정보 가져오기
    public Student getStudentInfo(int idUser) {
        return userRepository.selectStu(idUser);
    }
    //교수정보 가져오기
    public Professor getProfessorInfo(int idUser) {
        return userRepository.selectProf(idUser);
    }
    //관리자 정보 가져오기
    public Student getAdminInfo(int idUser) {
        return userRepository.selectAdmin(idUser);
    }

    //id로 단일정보 가져오기
    public String getStudentName(int idUser){
        return userRepository.getStuName(idUser);
    }
    public int getStudentId(int idUser){
        return userRepository.getStuId(idUser);
    }
    public String getProfessorName(int idUser){
        return userRepository.getProfName(idUser);
    }
    public int getProfessorId(int idUser){
        return userRepository.getProfId(idUser);
    }
    public String getAdminName(int idUser){
        return userRepository.getAdminName(idUser);
    }
    public int getAdminId(int idUser){
        return userRepository.getAdminId(idUser);
    }


    // 메신저용 코드 추가
    public String getRoleByLoginId(String loginId) {
        return userRepository.getRoleByLoginId(loginId);
    }
    public String getLoginIdById(int idUser) {
        return userRepository.getLoginIdById(idUser);
    }

    //중복 가입 체크
//    private void validateDuplicateUser(User user){
//        User findUser = userRepository.findByLoginId(user.getLoginId());
//        if(findUser != null){
//            throw new IllegalStateException("이미 가입된 회원입니다.");
//        }
//    }
    // 찾기-로그인아이디,로그인비밀번호
    public String findLoginIdByNameAndEmail(String name, String email) {
        return userRepository.findLoginIdByNameAndEmail(name, email);
    }

    public String resetPasswordAndGetTempPassword(String loginId, String email) {
        User user = userRepository.findByLoginIdAndEmail(loginId, email);
        if (user != null) {
            String tempPassword = generateTempPassword();
            user.setPassword(passwordEncoder.encode(tempPassword));
            userRepository.updateUserPassword(user);
            return tempPassword;
        }
        return null;
    }

    private String generateTempPassword() {
        return "temporaryPassword"; // 임시 비밀번호 생성 로직
    }

}
