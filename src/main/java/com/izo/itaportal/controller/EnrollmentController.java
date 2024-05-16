package com.izo.itaportal.controller;

import com.izo.itaportal.model.Enrollment;
import com.izo.itaportal.service.EnrollmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/enrollment")
public class EnrollmentController {
    @Autowired
    private EnrollmentService enrollmentService;

    @GetMapping("/form")
    public String showEnrollmentForm() {
        return "enrollment/enrollment";
    }
    @GetMapping("/enrollmentapplylist")

    public String enrollmentapplylist(Model model) {
        model.addAttribute("enrollments",enrollmentService.getAllEnrollments());
        return "/enrollment/enrollmentapplylist";

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

    // 수정된 경로: RESTful 방식에 더 적합하게
    @GetMapping("/student/{idStudent}")
    public ResponseEntity<List<Enrollment>> getEnrollmentsByIdStudent(@PathVariable int idStudent) {
        return ResponseEntity.ok(enrollmentService.getEnrollmentsByIdStudent(idStudent));
    }
}

//@GetMapping("/by-student/{idStudent}")
//public ResponseEntity<List<Enrollment>> getEnrollmentsByIdStudent(@PathVariable int idStudent) {
//    return ResponseEntity.ok(enrollmentService.getEnrollmentsByIdStudent(idStudent));
//}