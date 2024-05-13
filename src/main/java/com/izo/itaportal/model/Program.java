package com.izo.itaportal.model;

import lombok.Data;

@Data
public class Program {

    private int pgmId; //프로그램코드
    private int cateId;    //주제분류코드
    private int roomId;        //강의실코드
    private String pgmName;    //프로그램명
    private String stDt;    //교육시작일자
    private String endDt;  //교육종료일자
    private String pgmTarget;  //교육대상
    private String pgmMethod;  //교육방법
    private String pgmPer;     //교육인원
    private String pgmFee;     //교육비


}
