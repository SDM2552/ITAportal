package com.izo.itaportal.repository;

import com.izo.itaportal.model.Enrollment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface EnrollmentRepository {

    void insertEnrollment(Enrollment enrollment);

    void deleteEnrollment(@Param("idStudent") int idStudent, @Param("idPgm") int idPgm);

    List<Enrollment> findEnrollmentsByIdStudent(int idStudent);

    List<Enrollment> findAllEnrollments();

    void updateEnrollmentStatus(@Param("idEnrollment") int idEnrollment, @Param("status") String status);
}