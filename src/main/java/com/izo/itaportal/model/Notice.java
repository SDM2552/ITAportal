package com.izo.itaportal.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//공지사항
//김봄이

@Data
public class Notice {
    //id
    private int idNotice;
    //글제목
    private String title;
    //글내용
    private String content;
    //작성일
    private String createdDate;
    //조회수
    private int views;
}
