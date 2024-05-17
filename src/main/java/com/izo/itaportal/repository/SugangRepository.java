package com.izo.itaportal.repository;

import com.izo.itaportal.dto.ProgramAllDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SugangRepository {

    public List<ProgramAllDto> findAll();

}
