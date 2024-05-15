package com.izo.itaportal.service;

import com.izo.itaportal.mapper.UserMapper;
import com.izo.itaportal.model.SignUpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    //학생 회원가입
    @Transactional
    public void insertStu(SignUpRequest signUpRequest){
        userMapper.insertUser(signUpRequest);
        String idUser = signUpRequest.getIdUser();
        userMapper.insertStu(signUpRequest);
    }

    //교수 회원가입


}
