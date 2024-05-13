package com.izo.itaportal.model;


import lombok.Data;
@Data
public class Admin {

    private int idAdmin; //행정코드
    private String name; //직원이름
    private String birth; //생년월일
    private String tel; //연락처
    private String address; //주소
    private int idUser; //회원코드
    private String gender; //성별

}
