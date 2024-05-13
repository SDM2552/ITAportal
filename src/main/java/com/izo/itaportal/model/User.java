package com.izo.itaportal.model;

import lombok.Data;

@Data
public class User {

    private int idUser;
    private String logId;
    private String password;
    private String role;
    private String registDate;
}
