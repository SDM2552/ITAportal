package com.izo.itaportal.dto;

import lombok.Data;

@Data
public class ProgramAllDto {
    private int idPgm; //프로그램코드
    private int idCate;    //주제분류코드
    private int idRoom;        //강의실코드
    private int idProf;     //강사번호
    private String pgmName;    //프로그램명
    private String stDt;    //교육시작일자
    private String endDt;  //교육종료일자
    private String sugangStDt; //접수시작일자
    private String sugangEndDt; //접수종료일자
    private String pgmTarget;  //교육대상
    private String pgmMethod;  //교육방법(온라인,오프라인)
    private int pgmPer;     //교육인원
    private int numOfStu; //수강 인원

    private String pgmFee;     //교육비
    private String PgmDay; //강의 요일
    private String PgmTime; //강의 시간

    private String cateName;   //주제분류명
    private String roomName;   //강의실명
    private String name; //강사 이름

    private boolean sugangClosed;
    private String profName; // 강사 이름 (새로 추가된 속성-디테일뷰 중복속성처리)

}
