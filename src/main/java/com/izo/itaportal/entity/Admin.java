package com.izo.itaportal.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Admin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idAdmin;
    private String name;
    private String birth;
    private String tel;
    private String address;
    private String gender;
    private int idUser;
}
