package com.izo.itaportal.repository;

import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.model.Sugang;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SugangRepository {

    public List<ProgramAllDto> findAll();

    public ProgramAllDto findById(int programId);

    public void saveSugang(int idUser, int idPgm);

}
