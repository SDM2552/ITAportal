package com.izo.itaportal.model;

import lombok.Data;

@Data
public class User {

    private Long idUser;
    private String logId;
    private String password;
    private String role;
    private String registDate;
}
