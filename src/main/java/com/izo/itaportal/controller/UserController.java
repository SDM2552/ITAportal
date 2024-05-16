package com.izo.itaportal.controller;

import com.izo.itaportal.model.SignUpRequest;
import com.izo.itaportal.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("user")
public class UserController {

    private final UserService userService;

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
    public String signUpCheck(SignUpRequest signUpRequest){
        if(signUpRequest.getRole().equals("stu")) {
            userService.insertStu(signUpRequest);
        } else if (signUpRequest.getRole().equals("prof")) {
            //교수일경우
            userService.insertProf(signUpRequest);
        }
        return "member/signUpSuccess";
    }

}
