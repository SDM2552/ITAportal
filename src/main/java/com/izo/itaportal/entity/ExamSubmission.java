package com.izo.itaportal.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ExamSubmission {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idSubmission; //과제제출 코드
    private int idProgram; //프로그램 코드
    private int idExam; //과제 코드
    private int idStudent; //학생 코드
    private int idFile; //파일 코드
    private String examStatus; //과제 제출 여부
}
