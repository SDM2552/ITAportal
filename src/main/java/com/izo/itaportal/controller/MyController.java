package com.izo.itaportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {


    @GetMapping("/")
    public String root(){
        return "sample3";
    }
    @GetMapping("/sample")
    public String sample01(){
        return "sample";
    }
    @GetMapping("/sample2")
    public String sample02(){
        return "sample2";
    }
    @GetMapping("/sample3")
    public String sample03(){ return "sample3"; }


    @GetMapping("/classList")
    public String classList(){
        return "class/classList";
    }
}
