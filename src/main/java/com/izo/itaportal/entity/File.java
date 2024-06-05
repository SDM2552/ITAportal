package com.izo.itaportal.entity;

import javax.persistence.*;

@Entity
public class File {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idFile; //파일코드
    private Integer idSubfile; //파일일련번호
    private String fileName; //파일 이름
    private Integer fileSize; //파일 용량
    private String fileType; // 파일 타입
    @Lob
    private byte[] data;

}
