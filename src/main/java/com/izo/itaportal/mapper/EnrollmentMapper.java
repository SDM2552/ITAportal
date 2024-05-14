package com.izo.itaportal.mapper;

import com.izo.itaportal.model.Enrollment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface EnrollmentMapper {
    void insertEnrollment(Enrollment enrollment);
    List<Enrollment> findAllEnrollments();
    List<Enrollment> findEnrollmentsByIdStudent(@Param("idStudent") int idStudent);
}