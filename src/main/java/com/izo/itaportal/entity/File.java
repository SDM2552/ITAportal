package com.izo.itaportal.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class File {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idFile; //파일코드
    private int idSubfile; //파일일련번호
    private  String originFilename; //원본파일이름
    private  String saveFilename; //저장파일이름
    private String filePath; //파일 경로
    private int fileSize; //파일 용량

}
