package com.izo.itaportal.repository;

import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.dto.StudentInfoDto;
import com.izo.itaportal.dto.SugangDto;
import com.izo.itaportal.model.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface StudentRepository {
    @Select("SELECT * FROM student")
    List<Student> findAll();

    //idStudent로 수강내역 조회
    public List<SugangDto> findByIdStudent(int idStudent);

    //idStudent로 수강내역 조회에 더해 courseStatus가 true인 값만 검색


    //어드민 수강신청취소대기완료
    @Select("SELECT * FROM student WHERE id_user = #{idUser}")
    Student findStudentByIdUser(int idUser);

    StudentInfoDto findStudentInfoByIdUser(int idUser);

    // 수강디테일, 강사디테일
    List<SugangDto> findCoursesByStudentId(@Param("idStudent") int idStudent);

    List<SugangDto> findEnrollmentsByStudentId(@Param("idStudent") int idStudent);

    ProgramAllDto findProgramById(@Param("id") int id);

    ProgramAllDto findProfessorById(@Param("id") int id);

    List<ProgramAllDto> findProgramsByStudentId(@Param("idStudent") int idStudent);
}
