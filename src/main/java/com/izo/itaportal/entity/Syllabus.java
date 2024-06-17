package com.izo.itaportal.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//김봄이

@Entity
@Data
public class Syllabus {

    @Id
    private int idPgm;
    private String courseOverview;    //프로그램 개요
    private String objective;    //수업목표
    private String teaching;    //강의 방식
    private String book;    //교재
    private String evaluation;    //평가 방식
    private String remarks;    //비고
    private int idProf;    //강사번호
}
