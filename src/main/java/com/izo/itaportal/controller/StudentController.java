package com.izo.itaportal.controller;

import com.izo.itaportal.dto.SugangDto;
import com.izo.itaportal.model.LoginResponse;
import com.izo.itaportal.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/stu")
public class StudentController {
    @Autowired
    StudentService studentService;
    @Autowired
    HttpSession session;

    @GetMapping("/myProgram") //수강중인 강의 조회 페이지
    public String myProgram(Model model){
        LoginResponse loginUser = (LoginResponse) session.getAttribute("loginUser");
        int idStudent = loginUser.getCommonId();
        List<SugangDto> sugangDto = studentService.GetCourceList(idStudent);
        model.addAttribute("sugangList", sugangDto);
        System.out.println("수강: " + sugangDto);
        return "/student/myProgram";
    }
    @GetMapping("/program") //수강 내역 조회 페이지
    public String sugangList(Model model){
        LoginResponse loginUser = (LoginResponse) session.getAttribute("loginUser");
        int idStudent = loginUser.getCommonId();
        List<SugangDto> sugangDto = studentService.GetSugangList(idStudent);
        model.addAttribute("sugangList", sugangDto);
        System.out.println("수강: " + sugangDto);
        return "enrollment/enrollmentapplylist";
    }
    @GetMapping("/exam") //과제 제출 페이지
    public String examPage(){
        return "student/exam";
    }
    @GetMapping("/examSubmit") //선택한 과제 제출 페이지
    public String examSubmit(){
        return "student/examSubmit";
    }
}
