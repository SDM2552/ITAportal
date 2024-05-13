package com.izo.itaportal.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Course_apply {

   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private Long id_course_apply;

    private String course_name;
    private String course_apply_date;
    private String course_apply_status;
    private Long id_student; //pk
    private Long id_category; //pk


}
