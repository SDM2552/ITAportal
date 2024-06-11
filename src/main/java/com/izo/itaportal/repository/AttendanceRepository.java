package com.izo.itaportal.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AttendanceRepository {
    void updateScore(@Param("idStudent") int idStudent, @Param("idPgm") int idPgm, @Param("score") int score);
}
