package com.izo.itaportal.dto;

import lombok.Data;

@Data
public class ExamSubmitDataDto {

    private int idStudent; // 학생 id
    private String studentName; // 학생 이름
    private String status; // 과제 제출 상태
    private String submitTime; //과제 제출 시간
    private String fileName; // 파일 이름
    private byte[] data; // 파일
    private int idFile;
    private int idPgm;
    private int score;
}
