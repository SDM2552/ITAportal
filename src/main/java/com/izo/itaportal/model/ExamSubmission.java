package com.izo.itaportal.model;

import lombok.Data;
@Data
public class ExamSubmission {

    private int idSubmission; //과제제출 코드
    private int idProgram; //프로그램 코드
    private int idExam; //과제 코드
    private int idStudent; //학생 코드
    private int idFile; //파일 코드
}
