package com.izo.itaportal.service;

import com.izo.itaportal.repository.UserRepository;
import com.izo.itaportal.model.SignUpRequest;
import com.izo.itaportal.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RegistrationService {

    @Autowired
    private AdminRepository adminRepository;
    @Autowired
    private UserRepository userRepository;

    @Transactional // 강사 회원 등록
    public void registerUserAndProfessor(SignUpRequest request){
        System.out.println("체크"+request.toString());
        userRepository.insertUser(request);
        userRepository.insertProf(request);
    }
    @Transactional //관리자 회원 등록
    public void registerUserAndAdmin(SignUpRequest request){
        System.out.println("체크"+request.toString());
        userRepository.insertUser(request);
        userRepository.insertAdmin(request);
    }

}
