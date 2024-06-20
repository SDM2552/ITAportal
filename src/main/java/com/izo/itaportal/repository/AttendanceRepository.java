package com.izo.itaportal.repository;

import com.izo.itaportal.dto.GradeDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AttendanceRepository {
    void updateScore(@Param("idStudent") int idStudent, @Param("idPgm") int idPgm, @Param("score") int score);

    public List<GradeDto> selectGradeByIdStudent(int idStudent);
}
