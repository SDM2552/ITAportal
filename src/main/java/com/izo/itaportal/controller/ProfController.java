package com.izo.itaportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/prof")
public class ProfController {

    @GetMapping("/list")
    public String classList(){
        //Program select
        return "";
    }

    @GetMapping("/syllabus")
    public String syllabus(){
        return "syllabus/input";
    }
}
