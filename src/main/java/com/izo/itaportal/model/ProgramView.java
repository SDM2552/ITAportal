package com.izo.itaportal.model;

import lombok.Data;

/**
 * 강의계획서 입력 및 휴보강신청을 위한 view를 받아올 클래스
 * SELECT id_pgm, cate_name, room_name, pgm_name, st_dt, end_dt, pgm_per, pgm_fee, id_prof
 *   FROM program p
 *   JOIN category c ON p.id_cate = c.id_cate
 *   JOIN class_room r ON p.id_room = r.id_room;
 *   WHERE p.id_pgm=?
 * @author 김봄이
 */

@Data
public class ProgramView {
    private int idPgm;
    private int idProf;
    private String cateName;
    private String roomName;
    private String pgmName;
    private String stDt;
    private String endDt;
    private String pgmPer;
    private String pgmFee;
    private String pgmTime;
    private String pgmDay;
}
