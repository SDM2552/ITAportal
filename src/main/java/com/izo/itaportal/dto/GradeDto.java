package com.izo.itaportal.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Data
public class GradeDto {
    private String cateName;
    private String pgmName;
    private String profName;
    private String stuName;
    private String endDt; //교육종료일자
    private int attStat;
    private int lateStat;
    private int absStat;
    private int examScore;

    public double getAttendanceRate() {
        int totalClasses = attStat + absStat;
        if (totalClasses == 0) {
            return 0;
        } else {
            double rate = (double) attStat / totalClasses * 100;
            BigDecimal bd = BigDecimal.valueOf(rate);
            bd = bd.setScale(1, RoundingMode.HALF_UP);
            return bd.doubleValue();
        }
    }
}
