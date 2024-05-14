package com.izo.itaportal.service;

import com.izo.itaportal.mapper.EnrollmentMapper;
import com.izo.itaportal.model.Enrollment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class EnrollmentService {
    @Autowired
    private EnrollmentMapper enrollmentMapper;

    public void applyForEnrollment(Enrollment enrollment) {
        enrollmentMapper.insertEnrollment(enrollment);
    }

    public List<Enrollment> getAllEnrollments() {
        return enrollmentMapper.findAllEnrollments();
    }

    public List<Enrollment> getEnrollmentsByIdStudent(int idStudent) {
        return enrollmentMapper.findEnrollmentsByIdStudent(idStudent);
    }
}