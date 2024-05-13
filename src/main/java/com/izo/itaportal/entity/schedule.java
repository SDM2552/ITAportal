package com.izo.itaportal.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//김봄이

@Entity
public class schedule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idSchedule;
    //프로그램코드 (FK)
    private int idProgram;
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
