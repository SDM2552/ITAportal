package com.izo.itaportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {


    @GetMapping("/")
    public String root(){
        return "root";
    }


    @GetMapping("/classList")
    public String classList(){
        return "class/classList";
    }
}
