package com.izo.itaportal.mapper;

import com.izo.itaportal.model.SignUpRequest;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    //유저테이블 추가
    public void insertUser(SignUpRequest signUpRequest);
    //학생테이블 추가
    public void insertStu(SignUpRequest signUpRequest);
    //교수테이블 추가
    public void insertProf(SignUpRequest signUpRequest);

    void insertAdmin(SignUpRequest request); // 관리자 등록
}
