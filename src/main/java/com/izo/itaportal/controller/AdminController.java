package com.izo.itaportal.controller;

import com.izo.itaportal.model.*;
import com.izo.itaportal.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private ProfessorService professorService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private RegistrationService registrationService;
    @Autowired
    private SugangService sugangService;
    @Autowired
    private HttpSession session;

    @GetMapping("/studentList") //학생 리스트 출력 페이지
    public String studentList(Model model){
        List<Student> students = studentService.getAllStudents();
        model.addAttribute("students", students);
        return "adminMember/studentList";
    }
    @GetMapping("/professorList") //강사 리스트 출력 페이지
    public String professorList(Model model){
        List<Professor> professors = professorService.getAllProfessors();
        model.addAttribute("professors", professors);
        return "adminMember/professorList";
    }
    @GetMapping("/adminList") //관리자 리스트 출력 페이지(작성중)
    public String AdminList(Model model){
        List<Admin> admins = adminService.getAllAdmin();
        model.addAttribute("admins", admins);
        return "adminMember/adminList";
    }
    @GetMapping("/registProfessor") // 강사 등록 페이지
    public String registProfessorForm(){
        return "adminMember/registProfessor";
    }
    @GetMapping("/registAdmin") // 관리자 등록 페이지
    public String registAdminForm(){
        return "adminMember/registAdmin";
    }

    @PostMapping("/professorSignUp") // 강사 등록
    public  String registerProfessor(@ModelAttribute SignUpRequest request){
        registrationService.registerUserAndProfessor(request);
        return "redirect:/admin/registProfessor";
    }
    @PostMapping("/adminSignUp") // 관리자 등록
    public String registAdmin(@ModelAttribute SignUpRequest request){
        registrationService.registerUserAndAdmin(request);
        return "redirect:/admin/registAdmin";
    }

    //수강 승인
    @PostMapping("/sugangOk")
    @ResponseBody
    @Transactional
    public ResponseEntity<String> sugangOk(@RequestParam("idPgm") int idPgm, @RequestParam("idStudent") int idStudent) {
        boolean isOkayd = sugangService.sugangOk(idPgm, idStudent);
        if (isOkayd) {
            sugangService.addAttendance(idPgm,idStudent);
            sugangService.addNumOfStu(idPgm);
            return ResponseEntity.ok("수강이 승인됐습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("수강 승인에 실패했습니다.");
        }
    }
    //수강 거부
    @PostMapping("/sugangNo")
    @ResponseBody
    public ResponseEntity<String> sugangNo(@RequestParam("idPgm") int idPgm, @RequestParam("idStudent") int idStudent) {
        boolean isCancelled = sugangService.sugangNo(idPgm, idStudent);
        if (isCancelled) {
            return ResponseEntity.ok("수강이 거부됐습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("수강 거부에 실패했습니다.");
        }
    }

    //휴보강신청 관리 페이지
    @GetMapping("/classReq")
    public String adminClassReqForm(Model model){
        model.addAttribute("classReq", adminService.selectAllClassRequest());
        return "/adminProgram/adminClassReq";
    }
    //휴보강신청 승인
    @PostMapping("/classReqOk")
    @ResponseBody
    public ResponseEntity<String> classReqOk(@RequestParam("idClassRequest") int idClassRequest) {
            adminService.updateApprove(idClassRequest);
            return ResponseEntity.ok("휴/보강 신청이 승인되었습니다.");
    }
    //휴보강신청 반려
    @PostMapping("/classReqNo")
    @ResponseBody
    public ResponseEntity<String> classReqNo(@RequestParam("idClassRequest") int idClassRequest) {
        adminService.updateReject(idClassRequest);
        return ResponseEntity.ok("휴/보강 신청을 반려했습니다.");
    }
}
