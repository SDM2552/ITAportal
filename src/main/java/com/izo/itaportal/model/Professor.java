package com.izo.itaportal.model;

import lombok.Data;

//김봄이

@Data
public class Professor {

    private int idProf;
    //이름
    private String name;
    //생년월일
    private String birth;
    //연락처
    private String tel;
    //성별
    private String gender;
    //주소
    private String address;
    //회원번호
    private int idUser;
}
