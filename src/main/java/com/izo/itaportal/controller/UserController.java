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
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("user")
public class UserController {

    private final UserService userService;

    @GetMapping("signUp")
    public String signUp(){
        return "member/signUp";
    }

    @PostMapping("signUpCheck")
    public String signUpCheck(SignUpRequest signUpRequest, String email01, String email02, Model model){
        String email = email01 + "@" + email02;
        email = email.replace(",", "");
        signUpRequest.setEmail(email);

        // 로그인 ID 중복 확인
        if (userService.isLoginIdDuplicate(signUpRequest.getLoginId())) {
            model.addAttribute("duplicateMessage", "이미 사용 중인 아이디입니다.");
            model.addAttribute("signUpRequest", signUpRequest); // 입력값 유지
            return "member/signUp"; // 회원 가입 페이지로 이동
        }

        // 중복이 없으면 사용자 등록을 시도합니다.
        try {
            userService.insertStu(signUpRequest);
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", "회원 가입 중 오류가 발생했습니다.");
            return "member/signUp";
        }
        return "member/signUpSuccess";
    }

    @GetMapping("/checkDuplicateId")
    @ResponseBody
    public String checkDuplicateId(@RequestParam("loginId") String loginId) {
        boolean isDuplicate = userService.isLoginIdDuplicate(loginId);
        return isDuplicate ? "duplicate" : "available";
    }

    //로그인
    @PostMapping("loginCheck")
    @ResponseBody
    @Transactional
    public LoginResponse loginCheck(LoginRequest loginReq, HttpServletRequest request){
        LoginResponse user = userService.loginCheck(loginReq);
        String userName; //로그인 유저 아이디
        int commonId; //stu,prof,admin 통합 id값 저장

        if (user != null) {
            switch (user.getRole()) {
                // idUser값으로 회원 이름 가져오기
                case "stu":
                    userName = userService.getStudentName(user.getIdUser());
                    commonId = userService.getStudentId(user.getIdUser());
                    break;
                case "prof":
                    userName = userService.getProfessorName(user.getIdUser());
                    commonId = userService.getProfessorId(user.getIdUser());
                    break;
                case "admin":
                    userName = userService.getAdminName(user.getIdUser());
                    commonId = userService.getAdminId(user.getIdUser());
                    break;
                default:
                    throw new IllegalArgumentException("허가받지 않은 사용자 입니다.");
            }
            user.setName(userName);
            user.setCommonId(commonId);
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

    //찾기-id,비밀번호
    @GetMapping("/findId")
    public String showFindIdForm() {
        return "member/findId";
    }

    @PostMapping("/findId")
    public String findId(@RequestParam String name, @RequestParam String email, Model model) {
        String loginId = userService.findLoginIdByNameAndEmail(name, email);
        if (loginId != null) {
            model.addAttribute("message", "아이디는 " + loginId + "입니다.");
        } else {
            model.addAttribute("message", "일치하는 사용자가 없습니다.");
        }
        return "member/findIdResult";
    }

    @GetMapping("/findPassword")
    public String showFindPasswordForm() {
        return "member/findPassword";
    }

    @PostMapping("/findPassword")
    public String findPassword(@RequestParam String loginId, @RequestParam String email, Model model) {
        String tempPassword = userService.resetPasswordAndGetTempPassword(loginId, email);
        if (tempPassword != null) {
            model.addAttribute("message", "임시 비밀번호는 " + tempPassword + " 입니다.");
        } else {
            model.addAttribute("message", "일치하는 사용자가 없습니다.");
        }
        return "member/findPasswordResult";
    }
}
