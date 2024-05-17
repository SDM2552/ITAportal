package com.izo.itaportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/stu")
public class StudentController {

    @GetMapping("/exam") //과제 제출 페이지
    public String examPage(){
        return "student/exam";
    }
    @GetMapping("/examSubmit") //선택한 과제 제출 페이지
    public String examSubmit(){
        return "student/examSubmit";
    }
}
