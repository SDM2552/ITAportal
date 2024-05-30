package com.izo.itaportal.model;

import lombok.Data;
//김봄이

@Data
public class Exam {

    private int idExam;
    //시험명
    private String name;
    //시험시작일
    private String startDate;
    //시험마감일
    private String endDate;
    //진행상태
    private String status;
    //제출인원
    private String count;
    //시험내용
    private String description;
    //프로그램코드 (FK)
    private int idProgram;
    //강사코드 (FK)
    private int idProf;
    //파일코드 (FK)
    private int idFile;
}
