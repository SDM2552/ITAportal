package com.izo.itaportal.service;

import com.izo.itaportal.mapper.UserMapper;
import com.izo.itaportal.model.SignUpRequest;
import com.izo.itaportal.model.User;
import com.izo.itaportal.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class UserService {

    @Autowired
    UserMapper userMapper;
    @Autowired
    UserRepository userRepository;

    //학생 회원가입
    @Transactional
    public void insertStu(SignUpRequest signUpRequest){
        userMapper.insertUser(signUpRequest);
        String idUser = signUpRequest.getIdUser();
        userMapper.insertStu(signUpRequest);
    }

    //교수 회원가입


    //중복 가입 체크
    private void validateDuplicateUser(User user){
        User findUser = userRepository.findByLoginId(user.getLoginId());
        if(findUser != null){
            throw new IllegalStateException("이미 가입된 회원입니다.");
        }
    }

}
