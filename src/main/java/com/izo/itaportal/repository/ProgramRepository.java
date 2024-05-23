package com.izo.itaportal.repository;


import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.model.Program;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProgramRepository {
    public List<Program> selectProgram();

    public Program selectProgramById(int idPgm);

    public ProgramAllDto selectProgramDetail(int idPgm);

    public int insert(Program program);

    public int update(Program program);

    public int delete(int idPgm);

    //강사용 강의리스트 조회 쿼리 @김봄이
    public List<Program> selectPgmForProf(int idProf);

    public List<ProgramAllDto> selectAllPgm(int idProf);

    ProgramAllDto selectPgmDetail(@Param("idProf") int idProf, @Param("idPgm") int idPgm);


    //어드민 수강신청취소대기완료
    @Select("SELECT * FROM program WHERE id_pgm = #{idPgm}")
    Program findProgramById(int idPgm);

    @Select("SELECT * FROM program")
    List<Program> findAllPrograms();

}
