package com.izo.itaportal.model;

import lombok.Data;
@Data
public class StudentStatus {

    private int idStudentStatus; //학적상태코드
    private String sub_day; //강의일
    private int attendanceTime; //출석횟수
    private int absenceTime; //결석횟수
    private int lateness; //지각횟수
    private int examScore; //중간고사 점수
    private int idStudent; //학생번호
    private int idProgram; //프로그램 코드
}
