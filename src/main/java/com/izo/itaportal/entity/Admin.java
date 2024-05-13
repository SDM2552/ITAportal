package com.izo.itaportal.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Admin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idAdmin;
    private String name;
    private String birth;
    private String tel;
    private String address;
    private Long idUser;
    private String gender;
    private Long idUser2;

    // 생성자, 게터, 세터 등의 필요한 메서드를 추가하세요
}
