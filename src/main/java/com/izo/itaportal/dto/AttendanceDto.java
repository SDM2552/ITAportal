package com.izo.itaportal.dto;

import lombok.Data;

@Data
public class AttendanceDto {
    private int idSugang; // 수강 신청 ID
    private int idStudent; // 학생 ID
    private int idCate; // 카테고리 ID
    private int idPgm; // 프로그램 ID
    private boolean courseStatus; // 수강 상태
    private String studentName; // 학생 이름
    private String userEmail;
    private String studentBirth; // 학생 생일
    private String studentTel; // 학생 전화번호
    private String studentAddress; // 학생 주소
    private String studentGender; // 학생 성별
    private int studentIdUser; // 학생 사용자 ID
    private String attendanceStatus; // 출석 상태
    private String lateStatus; // 지각 상태
    private String absenceStatus; // 결석 상태
}
