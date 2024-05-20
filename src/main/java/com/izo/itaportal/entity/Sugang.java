package com.izo.itaportal.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Sugang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idSugang; // 수강 신청 ID
    private int id_student;
    private int idPgm; // 프로그램 ID
    private  String stDt; // 수강신청일
    private String status; //수강신청상태

}
