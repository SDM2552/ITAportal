package com.izo.itaportal.controller;

import com.izo.itaportal.model.LoginRequest;
import com.izo.itaportal.model.LoginResponse;
import com.izo.itaportal.model.SignUpRequest;

import com.izo.itaportal.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("user")
public class UserController {

    private final UserService userService;

//    @GetMapping("signUp1")
//    public String signUpSun(){
//        return "member/signUpSun";
//    }

    @GetMapping("signUp")
    public String signUp(){
        return "member/signUp";
    }

    @PostMapping("signUpCheck")
    public String signUpCheck(SignUpRequest signUpRequest, String email01, String email2){

           String email = email01+"@"+email2;
        email = email.replace(",", "");
        signUpRequest.setEmail(email);
//        if(signUpRequest.getRole().equals("stu")) {
            userService.insertStu(signUpRequest);
//        } else if (signUpRequest.getRole().equals("prof")) {
//            //교수일경우
//            userService.insertProf(signUpRequest);
//        }
        return "member/signUpSuccess";
    }

    //로그인
    @PostMapping("loginCheck")
    @ResponseBody
    @Transactional
    public LoginResponse loginCheck(LoginRequest loginReq, HttpServletRequest request){
        LoginResponse user = userService.loginCheck(loginReq);
        String userName;

        if (user != null) {
            switch (user.getRole()) {
                // idUser값으로 회원 이름 가져오기
                case "stu":
                    userName = userService.getStudentName(user.getIdUser());
                    break;
                case "prof":
                    userName = userService.getProfessorName(user.getIdUser());
                    break;
                case "admin":
                    userName = userService.getAdminName(user.getIdUser());
                    break;
                default:
                    throw new IllegalArgumentException("허가받지 않은 사용자 입니다.");
            }
            user.setName(userName);
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", user);
            session.setMaxInactiveInterval(60 * 30);
        }
        return user;
    }

    @GetMapping("logined")
    public String logined(RedirectAttributes model, HttpSession session){
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        if (user.getRole().equals("stu")) {
            System.out.println(userService.getStudentInfo(user.getIdUser()));
            model.addFlashAttribute("userInfo",userService.getStudentInfo(user.getIdUser()));
        } else if (user.getRole().equals("prof")) {
            model.addFlashAttribute("userInfo",userService.getProfessorInfo(user.getIdUser()));
        }
        model.addFlashAttribute("loginUser", user);
        return "redirect:/";
    }

    //로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

}
