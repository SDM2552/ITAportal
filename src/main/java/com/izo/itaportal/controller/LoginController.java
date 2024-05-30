package com.izo.itaportal.controller;

import com.izo.itaportal.model.LoginRequest;
import com.izo.itaportal.model.LoginResponse;
import com.izo.itaportal.service.LoginService;
import com.izo.itaportal.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("user")
public class LoginController {

    private final LoginService loginService;
    private final UserService userService;

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

    @GetMapping("/loginPage")
    public String showLoginPage() {
        return "member/loginPage";
    }
    @GetMapping("/loginPage2")
    public String showLoginPage2() {
        return "loginPage2";
    }

    @PostMapping("/loginPage-login")
    @Transactional
    public String loginPage(@RequestParam String loginId, @RequestParam String password, HttpServletRequest request, Model model) {
        LoginRequest loginReq = new LoginRequest();
        loginReq.setLoginId(loginId);
        loginReq.setPassword(password);

        LoginResponse user = userService.loginCheck(loginReq);
        if (user != null) {
            setUpUserSession(user, request);
            return "redirect:/";
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 잘못되었습니다.");
            return "loginPage3";
        }
    }

    private void setUpUserSession(LoginResponse user, HttpServletRequest request) {
        String userName;
        int commonId;
        switch (user.getRole()) {
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
}
