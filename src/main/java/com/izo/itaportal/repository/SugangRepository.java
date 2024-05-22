package com.izo.itaportal.repository;

import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.dto.SugangDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SugangRepository {

    public List<ProgramAllDto> findAll();

    public ProgramAllDto findById(int programId);
    public List<SugangDto> findByIdStudentAndCourseStatus(int idStudent);
    public List<SugangDto> findAllSugang();

    public void saveSugang(int commonId, int idPgm, int idCate);

    public int updateSugangStatus(int idPgm, int idStudent);

    public int updateToSugangOk(int idPgm, int idStudent);
    public int updateToSugangNo(int idPgm, int idStudent);

}
