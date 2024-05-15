package com.izo.itaportal.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("user")
public class UserController {

    @GetMapping("signUp1")
    public String signUpSun(){
        return "member/signUpSun";
    }

    @PostMapping("signUp2")
    public String signUp(@RequestParam String role, Model model){
            model.addAttribute("role",role);
//        System.out.println(role);
        return "member/signUp";
    }

    @PostMapping("signUpCheck")
    public String signUpCheck(){
//        if(role == "stu") {
//
//        } else if (role == "prof") {
//
//        }
        return "";
    }

}
