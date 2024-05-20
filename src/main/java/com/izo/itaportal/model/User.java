package com.izo.itaportal.model;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {

    private int idUser;
    private String loginId;
    private String password;
    private String role;
    private String registDate;
    private String email;
}
