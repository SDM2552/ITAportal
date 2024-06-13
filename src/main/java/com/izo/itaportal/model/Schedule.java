package com.izo.itaportal.model;

import lombok.Data;

//김봄이

@Data
public class Schedule {

    private int idSched;    //PK
    private int idPgm;    //프로그램코드 (FK)
    private int schedNo;    //주차
    private String daySched;   //수업일자
    private String pgmTime; //수업시간
    private String learningContents;    //학습내용
    private String learningDetail;    //학습방법
    private String note;    //비고

}
