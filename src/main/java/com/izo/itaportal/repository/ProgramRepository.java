package com.izo.itaportal.repository;


import com.izo.itaportal.model.Program;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProgramRepository {
    public List<Program> selectProgram();
    public Program selectProgramById(int idPgm);
    public int insert(Program program);

    public int update(Program program);

    public int delete(int idPgm);

}
