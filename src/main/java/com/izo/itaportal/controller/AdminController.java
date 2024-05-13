package com.izo.itaportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @GetMapping("/studentList")
    public String Member(){

        return "adminMember/studentList";
    }
}
