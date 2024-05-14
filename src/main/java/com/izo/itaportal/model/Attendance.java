package com.izo.itaportal.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
public class Attendance {


    private int idAttendance;

    private int idStudent;
    private String division;

}


