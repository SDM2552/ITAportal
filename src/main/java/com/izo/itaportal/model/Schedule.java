package com.izo.itaportal.model;

import lombok.Data;

//김봄이

@Data
public class Schedule {

    private int idSche;
    //프로그램코드 (FK)
    private int idPgm;
    //수업일자
    private String daySched;
    //시작시간
    private String startSched;
    //종료시간
    private String endSched;
    //학습내용
    private String learningContents;
    //학습방법
    private String learningDetail;
    //비고
    private String note;

}
