package com.izo.itaportal.repository;

import com.izo.itaportal.model.LoginResponse;
import com.izo.itaportal.model.SignUpRequest;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {

    //유저테이블 추가
    public void insertUser(SignUpRequest signUpRequest);

    //학생테이블 추가
    public void insertStu(SignUpRequest signUpRequest);

    //교수테이블 추가
    public void insertProf(SignUpRequest signUpRequest);

    void insertAdmin(SignUpRequest request); // 관리자 등록

    public LoginResponse getUserByLoginId(String loginId);

}
