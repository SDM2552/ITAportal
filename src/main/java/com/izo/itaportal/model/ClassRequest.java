package com.izo.itaportal.model;

import lombok.Data;
//김봄이

@Data
public class ClassRequest {
    //id
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
    private int idSched;
    //프로그램코드 (FK)
    private int idPgm;
    //강의실코드 (FK)
    private int idRoom;

    private String pgmName;
    private String roomName;
    private String daySched;
}
