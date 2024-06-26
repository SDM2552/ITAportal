package com.izo.itaportal.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//김봄이

@Entity
public class Exam {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idExam;
    //시험명
    private String name;
    //시험시작일
    private String startDate;
    //시험마감일
    private String endDate;
    //진행상태
    private String status;
    //제출인원
    private int  count;
    //시험내용
    private String description;
    //프로그램코드 (FK)
    private int idProgram;
    //강사코드 (FK)
    private int idProf;

}
