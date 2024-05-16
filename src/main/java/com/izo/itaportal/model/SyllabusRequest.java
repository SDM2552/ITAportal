package com.izo.itaportal.model;

import lombok.Builder;
import lombok.Data;

/**
 * 강의계획서 조회용 POJO
 * @author 김봄이
 */
@Data
@Builder
public class SyllabusRequest {
    private int idProf;
    private int idPgm;
}
