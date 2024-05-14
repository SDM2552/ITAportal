package com.izo.itaportal.model;


import lombok.Data;

@Data
public class Admin {

    private int idAdmin;
    private String name;
    private String birth;
    private String tel;
    private String address;
    private String gender;
    private int idUser;
}


