package com.izo.itaportal.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
public class Student {

    private int idStudent;

    private String name;
    private String birth;
    private String tel;
    private String address;
    private String gender;
    private int idUser;  //pk값 아이디x, 아이디번호



}
