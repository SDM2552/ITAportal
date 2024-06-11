package com.izo.itaportal.model;

import lombok.Data;

@Data
public class Attendance {
    private int id_attendance;
    private int id_pgm; //개설강의코드
    private int idStudent; //학생코드
    private int att_stat; //출석횟수
    private int late_stat; //지각횟수
    private int abs_stat; //결석횟수
    private int examScore; //과제 점수
}


