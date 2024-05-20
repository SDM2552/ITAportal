package com.izo.itaportal.model;

import lombok.Data;

@Data
public class LoginResponse {
    private String loginId;
    private String password;
    private String role;
    private int idUser;
    private String name;


}
