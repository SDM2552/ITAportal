package com.izo.itaportal.repository;

import com.izo.itaportal.model.Enrollment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface EnrollmentRepository {
    void insertEnrollment(Enrollment enrollment);
    List<Enrollment> findAllEnrollments();
    List<Enrollment> findEnrollmentsByIdStudent(@Param("idStudent") int idStudent);
    Enrollment findEnrollmentDetails(@Param("idEnrollment") int idEnrollment);
}