package com.izo.itaportal.model;

import lombok.Data;

@Data
public class SignUpRequest {
    private String loginId;
    private String password;
    private String name;
    private int birth;
    private int birthyy;
    private int birthmm;
    private int birthdd;
    private String tel;
    private int phone1;
    private int phone2;
    private int phone3;
    private String address;
    private String gender;
    private String idUser;
    private String role;

    public String getBirth() {
        return String.format("%04d%02d%02d", birthyy, birthmm, birthdd);
    }
    public String getTel() {
        return String.format("%03d-%d-%d", phone1, phone2, phone3);
    }


}
