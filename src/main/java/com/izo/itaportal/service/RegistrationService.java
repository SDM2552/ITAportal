package com.izo.itaportal.service;

import com.izo.itaportal.mapper.UserMapper;
import com.izo.itaportal.model.Admin;
import com.izo.itaportal.model.SignUpRequest;
import com.izo.itaportal.model.User;
import com.izo.itaportal.repository.AdminRepository;
import com.izo.itaportal.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RegistrationService {

    @Autowired
    private AdminRepository adminRepository;
    @Autowired
    private UserMapper userMapper;

    @Transactional
    public void registerUserAndAdmin(SignUpRequest request){
        System.out.println("체크"+request.toString());


        userMapper.insertUser(request);

        userMapper.insertAdmin(request);
    }
}
