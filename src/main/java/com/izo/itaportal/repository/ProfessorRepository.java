package com.izo.itaportal.repository;

import com.izo.itaportal.dto.AttendanceDto;
import com.izo.itaportal.model.Professor;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProfessorRepository {

    @Select("SELECT * FROM professor")
    List<Professor> findAll();
    List<AttendanceDto> findByIdPgmAndCourseStatus(int idPgm);
    public int attendance(int idPgm, int idStudent);
    public int lateStatus(int idPgm, int idStudent);
    public int absenceStatus(int idPgm, int idStudent);
}
