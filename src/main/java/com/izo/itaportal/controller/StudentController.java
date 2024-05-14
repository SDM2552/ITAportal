package com.izo.itaportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/stu")
public class StudentController {

    @GetMapping("/exam")
    public String examPage(){
        return "student/exam";
    }
    @GetMapping("/examSubmit")
    public String examSubmit(){
        return "student/examSubmit";
    }
}
