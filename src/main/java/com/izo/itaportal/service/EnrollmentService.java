package com.izo.itaportal.service;

import com.izo.itaportal.mapper.EnrollmentMapper;
import com.izo.itaportal.model.Enrollment;
import com.izo.itaportal.model.Program;
import com.izo.itaportal.model.Student;
import com.izo.itaportal.repository.EnrollmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnrollmentService {
    @Autowired
    private EnrollmentMapper enrollmentMapper;

    @Autowired
    private StudentService studentService;

    @Autowired
    private ProgramService programService;
    @Autowired
    private EnrollmentRepository enrollmentRepository;

    public void applyForEnrollment(Enrollment enrollment) {
        enrollmentMapper.insertEnrollment(enrollment);
    }

    public List<Enrollment> getAllEnrollments() {
        List<Enrollment> enrollments = enrollmentMapper.findAllEnrollments();
        for (Enrollment enrollment : enrollments) {
            Program program = programService.selectProgramById(enrollment.getIdPgm());
            enrollment.setPgmName(program.getPgmName());
            enrollment.setStDt(program.getStDt());
        }
        return enrollments;
    }

    public List<Enrollment> getEnrollmentsByIdStudent(int idStudent) {
        List<Enrollment> enrollments = enrollmentMapper.findEnrollmentsByIdStudent(idStudent);
        for (Enrollment enrollment : enrollments) {
            Program program = programService.selectProgramById(enrollment.getIdPgm());
            enrollment.setPgmName(program.getPgmName());
            enrollment.setStDt(program.getStDt());
        }
        return enrollments;
    }

    public Enrollment getEnrollmentDetails(int idEnrollment) {
        Enrollment enrollment = enrollmentRepository.findEnrollmentDetails(idEnrollment);
        Program program = programService.selectProgramById(enrollment.getIdPgm());
        enrollment.setPgmName(program.getPgmName());
        enrollment.setStDt(program.getStDt());
        return enrollment;
    }
}
