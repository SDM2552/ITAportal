package com.izo.itaportal.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
public class Attendance {

    private int id_pgm; //개설강의코드
    private int idStudent; //학생코드
    private String att_stat; //출석횟수
    private String late_stat; //지각횟수
    private String abs_stat; //결석횟수
}


