package com.izo.itaportal.model;

import lombok.Data;
//김봄이

@Data
public class Syllabus {

    //프로그램 코드
    private int idPgm;
    //프로그램 개요
    private String courseOverview;
    //수업목표
    private String objective;
    //강의 방식
    private String teaching;
    //교재
    private String book;
    //평가 방식
    private String evaluation;
    //비고
    private String remarks;
    //강사번호
    private int idProf;
}
