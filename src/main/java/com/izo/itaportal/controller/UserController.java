package com.izo.itaportal.controller;

import com.izo.itaportal.model.LoginRequest;
import com.izo.itaportal.model.LoginResponse;
import com.izo.itaportal.model.SignUpRequest;
import com.izo.itaportal.model.User;
import com.izo.itaportal.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

    //로그인
    @PostMapping("loginCheck")
    @ResponseBody
    public LoginResponse loginCheck(LoginRequest loginReq, HttpServletRequest request){
        LoginResponse user = userService.loginCheck(loginReq);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", user);
            session.setMaxInactiveInterval(60 * 30);
        }

        return user;
    }

    @GetMapping("logined")
    public String logined(Model model, HttpSession session){
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        model.addAttribute("loginUser", user);
        return "redirect:/sample2";
    }



    //로그아웃
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/sample3";
    }

}
