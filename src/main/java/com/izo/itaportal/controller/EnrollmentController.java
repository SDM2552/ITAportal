package com.izo.itaportal.controller;

import com.izo.itaportal.model.Enrollment;
import com.izo.itaportal.service.EnrollmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/enrollment")
public class EnrollmentController {
    @Autowired
    private EnrollmentService enrollmentService;

    @GetMapping("/form")
    public String showEnrollmentForm() {
        return "enrollment";
    }

    @PostMapping("/apply")
    public ResponseEntity<?> applyForEnrollment(@RequestBody Enrollment enrollment) {
        enrollmentService.applyForEnrollment(enrollment);
        return ResponseEntity.ok("Enrollment application submitted successfully.");
    }

    @GetMapping("/all")
    public ResponseEntity<List<Enrollment>> getAllEnrollments() {
        return ResponseEntity.ok(enrollmentService.getAllEnrollments());
    }

    @GetMapping("/by-student/{idStudent}")
    public ResponseEntity<List<Enrollment>> getEnrollmentsByIdStudent(@PathVariable int idStudent) {
        return ResponseEntity.ok(enrollmentService.getEnrollmentsByIdStudent(idStudent));
    }
}