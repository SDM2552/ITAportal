package com.izo.itaportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SampleController {

    @GetMapping("/sample3")
    public String sample03(){
        return "sample3";
    }
//    @GetMapping("/enrollcourse")
//    public String enrollCourse(){
//        return "enrollcourse";
//    }
}
