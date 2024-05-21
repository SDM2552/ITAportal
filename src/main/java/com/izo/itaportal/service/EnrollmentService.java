package com.izo.itaportal.service;

import com.izo.itaportal.model.Enrollment;
import com.izo.itaportal.repository.EnrollmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnrollmentService {

    @Autowired
    private EnrollmentRepository enrollmentRepository;

    public void applyForEnrollment(Enrollment enrollment) {
        enrollmentRepository.insertEnrollment(enrollment);
    }

    public List<Enrollment> getEnrollmentsByIdStudent(int idStudent) {
        return enrollmentRepository.findEnrollmentsByIdStudent(idStudent);
    }

    public List<Enrollment> getAllEnrollments() {
        return enrollmentRepository.findAllEnrollments();
    }

    public void updateEnrollmentStatus(int idEnrollment, String status) {
        enrollmentRepository.updateEnrollmentStatus(idEnrollment, status);
    }

    public void cancelEnrollment(int idStudent, int idPgm) {
        enrollmentRepository.deleteEnrollment(idStudent, idPgm);
    }

}

