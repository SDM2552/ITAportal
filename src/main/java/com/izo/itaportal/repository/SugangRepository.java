package com.izo.itaportal.repository;

import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.dto.SugangDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SugangRepository {

    public List<ProgramAllDto> findAll();

    public ProgramAllDto findById(int programId);
    public List<SugangDto> findByIdStudentAndCourseStatus(int idStudent);
    public List<SugangDto> findAllSugang(@Param("limit") int limit, @Param("offset") int offset);
    int selectSugangCount();
    public int checkEnrollment(int commonId, int idPgm);
    public void saveSugang(int commonId, int idPgm, int idCate);

    public int updateSugangStatus(int idPgm, int idStudent);

    public int updateToSugangOk(int idPgm, int idStudent);
    public int updateToSugangNo(int idPgm, int idStudent);

    public void createAttendance(int idPgm, int idStudent);
    public void updateNumOfStu(int idPgm);



}
