package com.izo.itaportal.dto;

import lombok.Data;

@Data
public class ExamDetail {

    private String ProgramName; //강의명
    private String name; //시험명
    private String description; //시험내용
    private String startDate; //시험시작일
    private String endDate; //시험마감일
    private String status; //진행상태
    private String count; //제출인원
}
