package com.izo.itaportal.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//김봄이

@Entity
public class Syllabus {

    //프로그램 코드
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idSyllabus;
    //프로그램 개요
    private String course_overview;
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
