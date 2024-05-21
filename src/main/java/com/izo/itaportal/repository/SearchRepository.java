package com.izo.itaportal.repository;

import com.izo.itaportal.dto.ProgramSearchDto;
import com.izo.itaportal.dto.CategoryDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SearchRepository {

    List<CategoryDto> findAllCategories();

    List<ProgramSearchDto> searchProgramsByCategoryAndName(@Param("cateName") String cateName, @Param("pgmName") String pgmName);
}
