package com.izo.itaportal.model;

import lombok.Data;

@Data
public class Sugang {
    private int idSugang; // 수강 신청 ID
    private int idUser; // 유저 ID
    private int idPgm; // 프로그램 ID
    private  String stDt; // 수강신청일
    private String status; //수강신청상태
}
