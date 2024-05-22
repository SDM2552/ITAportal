package com.izo.itaportal.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//김봄이

@Entity
public class ClassRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idClassRequest;
    //수업일자
    private String classDate;
    //보강일자
    private String makeUpDate;
    //보강사유
    private String remarks;
    //신청일시
    private String appDate;
    //처리일자
    private String procDate;
    //강사번호 (FK)
    private int idProf;
    //주차코드 (FK)
    private int idWeek;
    //프로그램코드 (FK)
    private int idProgram;
    //보강 강의실 코드
    private int idRoomd;
}
