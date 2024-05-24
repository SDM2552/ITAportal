package com.izo.itaportal.dto;

import lombok.Data;

//수강 내역 조회에 필요한 DTO
@Data
public class SugangDto {
    private int idEnrollment; // 수강 신청 ID
    private int idStudent;    // 학생 ID
    private String pgmName;  //프로그램 이름
    private int idPgm;    // 프로그램 ID
    private int idCate;    //  카테고리ID
    private String sugangStDt;    // 수강 신청 날짜
    private String status;    // 수강 신청 상태 (예: "확인중", "승인", "취소")
    private boolean courseStatus;

    private String stDt;    //교육시작일자
    private String endDt;  //교육종료일자
    private String pgmFee;     //교육비
    private String PgmDay; //강의 요일
    private String PgmTime; //강의 시간

    private String cateName;   //주제분류명
    private String roomName;   //강의실명
    private String name; //강사 이름
    private String stuName;

    // 새로운 필드 추가
    private int idProf; // 강사 ID
}
