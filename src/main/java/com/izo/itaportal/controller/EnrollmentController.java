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
        if (session.getAttribute("idUser") == null) {
            return "redirect:/user/login";
        }

        // 프로그램 정보 가져오기
        Program program = programService.getProgramById(idPgm);
        model.addAttribute("program", program);

        // idUser를 통해 학생 정보 가져오기
        int idUser = (int) session.getAttribute("idUser");
        Student student = studentService.getStudentByIdUser(idUser);
        model.addAttribute("student", student);

        return "enrollment/enrollment";
    }

//    @GetMapping("/form")
//    public String showEnrollmentForm() {
//
//        return "/enrollment/enrollment";
//
//    }

    @GetMapping("/enrollmentapplylist")
    public String enrollmentApplyList(Model model, HttpSession session) {
        if (session.getAttribute("idUser") == null) {
            return "redirect:/user/login";
        }

        int idUser = (int) session.getAttribute("idUser");
        Student student = studentService.getStudentByIdUser(idUser);
        List<Enrollment> enrollments = enrollmentService.getEnrollmentsByIdStudent(student.getIdStudent());
        model.addAttribute("enrollments", enrollments);
        return "enrollment/enrollmentapplylist";
    }
    /**
     *위로 이동
     * */
//    @GetMapping("/enrollmentapplylist")
//
//    public String enrollmentapplylist(Model model) {
//        model.addAttribute("enrollments",enrollmentService.getAllEnrollments());
//        return "/enrollment/enrollmentapplylist";
//
//    }


    @PostMapping("/apply")
    public String applyForEnrollment(@ModelAttribute Enrollment enrollment) {
        enrollmentService.applyForEnrollment(enrollment);
        return "redirect:/enrollment/success";
    }
//    @PostMapping("/apply")
//    public ResponseEntity<?> applyForEnrollment(@RequestBody Enrollment enrollment) {
//        enrollmentService.applyForEnrollment(enrollment);
//        return ResponseEntity.ok("Enrollment application submitted successfully.");
//    }

    @GetMapping("/all")
    public ResponseEntity<List<Enrollment>> getAllEnrollments() {
        return ResponseEntity.ok(enrollmentService.getAllEnrollments());
    }

    // 수정된 경로: RESTful 방식에 더 적합하게
    @GetMapping("/student/{idStudent}")
    public ResponseEntity<List<Enrollment>> getEnrollmentsByIdStudent(@PathVariable int idStudent) {
        return ResponseEntity.ok(enrollmentService.getEnrollmentsByIdStudent(idStudent));
    }
    
    //상태이상
    @PostMapping("/updateStatus")
    public String updateEnrollmentStatus(@RequestParam("idEnrollment") int idEnrollment,
                                         @RequestParam("status") String status,
                                         HttpSession session) {
        if (!"admin".equals(session.getAttribute("role"))) {
            return "redirect:/error";
        }
        enrollmentService.updateEnrollmentStatus(idEnrollment, status);
        return "redirect:/enrollment/enrollmentapplylist";
    }

    public String showPrograms(Model model) {
        List<Program> programs = programService.findAllPrograms();
        model.addAttribute("programs", programs);
        return "enrollment/programs";
    }


}

//@GetMapping("/by-student/{idStudent}")
//public ResponseEntity<List<Enrollment>> getEnrollmentsByIdStudent(@PathVariable int idStudent) {
//    return ResponseEntity.ok(enrollmentService.getEnrollmentsByIdStudent(idStudent));
//}