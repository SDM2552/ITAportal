package com.izo.itaportal.model;

import lombok.Data;
@Data
public class File {

    private int idFile; //파일코드
    private int idSubfile; //파일일련번호
    private  String originFilename; //원본파일이름
    private  String saveFilename; //저장파일이름
    private String filePath; //파일 경로

}
