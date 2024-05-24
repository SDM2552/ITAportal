package com.izo.itaportal.entity;

import javax.persistence.*;

//공지사항
//김봄이

@Entity
public class Notice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idNotice;
    //글제목
    private String title;
    //글내용
    @Lob
    private String content;
    //작성일
    private String createdDate;
    //조회수
    private int views;
}
