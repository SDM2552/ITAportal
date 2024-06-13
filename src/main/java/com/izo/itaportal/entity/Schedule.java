package com.izo.itaportal.entity;

import org.hibernate.annotations.ColumnDefault;
import org.springframework.lang.Nullable;

import javax.persistence.*;

//김봄이

@Entity
public class Schedule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idSched; //PK
    private int idPgm; //PK+FK 프로그램코드
    private String schedNo; //수업주차
    private String daySched;    //수업일자
    private String pgmTime;    //시작시간
    private String learningContents;    //학습내용
    private String learningDetail;    //학습방법
    private String note;    //비고

}
