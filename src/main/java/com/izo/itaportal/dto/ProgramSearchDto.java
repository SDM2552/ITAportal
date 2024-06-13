package com.izo.itaportal.dto;

import lombok.Data;

@Data
public class ProgramSearchDto {
    private int idPgm;

    private String pgmName;
    private String cateName;
    private String stDt;
    private String endDt;
    private String sugangStDt;
    private String sugangEndDt;
    private String pgmFee;
    private boolean sugangClosed;

}
