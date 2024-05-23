package com.izo.itaportal.repository;

import com.izo.itaportal.model.LoginResponse;
import com.izo.itaportal.model.Professor;
import com.izo.itaportal.model.SignUpRequest;
import com.izo.itaportal.model.Student;
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


    //학생정보 가져오기
    public Student selectStu(int idUser);
    //교수정보 가져오기
    public Professor selectProf(int idUser);
    //관리자 정보 가져오기
    public Student selectAdmin(int idUser);

    //이름값 가져오기
    public String getStuName(int idUser);
    public String getProfName(int idUser);
    public String getAdminName(int idUser);

    //id값 가져오기
    public int getStuId(int idUser);
    public int getProfId(int idUser);
    public int getAdminId(int idUser);


    // 메신저용 추가 코드 시작
    String getLoginIdById(int idUser);
    String getRoleById(int idUser);
    String getRoleByLoginId(String loginId);

}
