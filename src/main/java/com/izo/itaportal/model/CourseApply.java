package com.izo.itaportal.model;

import lombok.Data;

@Data
public class CourseApply {

   private int idCourseApply;
    private String courseName;
    private String courseApplyDate;
    private String courseApplyStatus;
    private int idStudent; //pk
    private int cateId; //pk


}
