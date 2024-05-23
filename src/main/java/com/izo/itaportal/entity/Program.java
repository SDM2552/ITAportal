package com.izo.itaportal.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Program {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idPgm; //프로그램코드
    private int idCate;    //주제분류코드
    private int idProf;
    private int idRoom;        //강의실코드//강사번호
    private String pgmName;    //프로그램명
    private String stDt;    //교육시작일자
    private String endDt;  //교육종료일자
    private String sugangStDt; //접수시작일자
    private String sugangEndDt; //접수종료일자
    private String pgmTarget;  //교육대상
    private String pgmMethod;  //교육방법
    private int pgmPer;     //교육 정원
    private int num_of_stu; //수강 인원
    private int pgmFee;     //교육비


}
