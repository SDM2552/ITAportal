package com.izo.itaportal.model;

import lombok.Data;

import javax.persistence.Id;

//조인테이블
@Data
public class Enrollment {

    private int idEnrollment; // 수강 신청 ID

    private int idStudent;    // 학생 ID
    private String pgmName;  //프로그램 이름
    private int idPgm;    // 프로그램 ID
    private int idCate;    //  카테고리ID
    private String stDt;    // 수강 신청 날짜

    private String status;    // 수강 신청 상태 (예: "확인중", "승인", "취소")


}
