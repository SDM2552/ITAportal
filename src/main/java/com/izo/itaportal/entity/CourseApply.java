package com.izo.itaportal.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class CourseApply {

   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private int idCourseApply;

    private String courseName;
    private String courseApplyDate;
    private String courseApplyStatus;
    private int idStudent; //pk
    private int idCategory; //pk


}
