package com.izo.itaportal.model;

import lombok.Data;

@Data
public class Course_apply {

   private Long id_course_apply;
    private String course_name;
    private String course_apply_date;
    private String course_apply_status;
    private Long id_student; //pk
    private Long id_category; //pk


}
