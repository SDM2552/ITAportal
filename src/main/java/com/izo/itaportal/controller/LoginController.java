package com.izo.itaportal.controller;

import com.izo.itaportal.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("user")
public class LoginController {

    private final LoginService loginService;

    @GetMapping("/login")
    public String showLoginForm() {
        return "loginRegister/login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String loginId, @RequestParam String password, Model model) {
        String storedPassword = loginService.getPasswordByLoginId(loginId);

        if (password.equals(storedPassword)) {
            return "redirect:/";
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 잘못되었습니다.");
            return "login";
        }
    }
}
