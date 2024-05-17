package com.izo.itaportal.service;

import com.izo.itaportal.model.LoginRequest;
import com.izo.itaportal.model.LoginResponse;
import com.izo.itaportal.repository.UserRepository;
import com.izo.itaportal.model.SignUpRequest;
import com.izo.itaportal.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

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
        userRepository.insertUser(signUpRequest);
        String idUser = signUpRequest.getIdUser();
        userRepository.insertStu(signUpRequest);
    }

    //교수 회원가입
    @Transactional
    public void insertProf(SignUpRequest signUpRequest){
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


    //중복 가입 체크
//    private void validateDuplicateUser(User user){
//        User findUser = userRepository.findByLoginId(user.getLoginId());
//        if(findUser != null){
//            throw new IllegalStateException("이미 가입된 회원입니다.");
//        }
//    }

}
