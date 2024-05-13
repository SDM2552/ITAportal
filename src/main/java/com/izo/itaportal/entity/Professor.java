package com.izo.itaportal.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//김봄이

@Entity
public class Professor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
