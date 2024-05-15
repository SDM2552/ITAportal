package com.izo.itaportal.model;

import lombok.Data;

@Data
public class SignUpRequest {
    private String loginId;
    private String password;
    private String name;
    private int birth;
    private String tel;
    private String address;
    private String gender;
    private String idUser;
    private String role;
}
