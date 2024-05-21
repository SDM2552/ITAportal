package com.izo.itaportal.repository;

import com.izo.itaportal.dto.ProgramAllDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SugangRepository {

    public List<ProgramAllDto> findAll();

    public ProgramAllDto findById(int programId);

    public void saveSugang(int commonId, int idPgm, int idCate);

    public int updateSugangStatus(int idPgm, int idStudent);

}
