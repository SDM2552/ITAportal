package com.izo.itaportal.service;

import com.izo.itaportal.mapper.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    private LoginMapper loginMapper;

    // 로그인 아이디를 사용하여 비밀번호 확인
    public String getPasswordByLoginId(String loginId) {
        return loginMapper.getPasswordByLoginId(loginId);
    }
}
