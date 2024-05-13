package com.izo.itaportal.model;


import lombok.Data;

@Data
public class Admin {

    private Long idAdmin;
    private String name;
    private String birth;
    private String tel;
    private String address;
    private Long idUser;
    private String gender;
    private Long idUser2;
}

