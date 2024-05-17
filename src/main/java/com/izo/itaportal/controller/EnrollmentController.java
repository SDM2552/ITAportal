package com.izo.itaportal.controller;

import com.izo.itaportal.model.Enrollment;
import com.izo.itaportal.model.Program;
import com.izo.itaportal.model.Student;
import com.izo.itaportal.service.EnrollmentService;
import com.izo.itaportal.service.ProgramService;
import com.izo.itaportal.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/enrollment")
public class EnrollmentController {
    @Autowired
    private EnrollmentService enrollmentService;

    @Autowired
    private ProgramService programService;

    @Autowired
    private StudentService studentService;

    @GetMapping("/form")
    public String showEnrollmentForm(@RequestParam("idPgm") int idPgm, Model model, HttpSession session) {
        // 로그인 체크
        if (session.getAttribute("idStudent") == null) {
            return "redirect:/user/login";
        }

        // 프로그램 정보 가져오기
        Program program = programService.selectProgramById(idPgm);
        model.addAttribute("program", program);

        // 학생 정보 가져오기
        int idStudent = (int) session.getAttribute("idStudent");
        Student student = studentService.getStudentById(idStudent);
        model.addAttribute("student", student);

        return "enrollment/enrollment";
    }

    @PostMapping("/apply")
    public ResponseEntity<?> applyForEnrollment(@RequestBody Enrollment enrollment) {
        enrollmentService.applyForEnrollment(enrollment);
        return ResponseEntity.ok("Enrollment application submitted successfully.");
    }

    @GetMapping("/enrollmentapplylist")
    public String enrollmentApplyList(Model model) {
        List<Enrollment> enrollments = enrollmentService.getAllEnrollments();
        model.addAttribute("enrollments", enrollments);
        return "enrollment/enrollmentapplylist";
    }

    @GetMapping("/all")
    public ResponseEntity<List<Enrollment>> getAllEnrollments() {
        return ResponseEntity.ok(enrollmentService.getAllEnrollments());
    }

    @GetMapping("/student/{idStudent}")
    public ResponseEntity<List<Enrollment>> getEnrollmentsByIdStudent(@PathVariable int idStudent) {
        return ResponseEntity.ok(enrollmentService.getEnrollmentsByIdStudent(idStudent));
    }
}