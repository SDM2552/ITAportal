package com.izo.itaportal.controller;


import com.izo.itaportal.model.Admin;
import com.izo.itaportal.model.LoginResponse;
import com.izo.itaportal.model.Professor;
import com.izo.itaportal.model.Student;
import com.izo.itaportal.service.MyPageService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class MyPageController {

    @Autowired
    private MyPageService myPageService;

    @Autowired
    private HttpSession httpSession;

    @GetMapping("/info")
    public String myPage(Model model) {
        LoginResponse user = (LoginResponse) httpSession.getAttribute("loginUser");
        if (user == null) {
            // 세션에 사용자가 없으면 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }
        Integer idUser = user.getIdUser();

        if (myPageService.isStudent(idUser)) {
            model.addAttribute("user", myPageService.getStudentById(idUser));
            return "/myPage/stuMyPage";
        } else if (myPageService.isProfessor(idUser)) {
            model.addAttribute("user", myPageService.getProfessorById(idUser));
            return "/myPage/profMyPage";
        } else if (myPageService.isAdmin(idUser)) {
            model.addAttribute("user", myPageService.getAdminById(idUser));
            return "/myPage/adminMyPage";
        } else {
            return "/";
        }
    }

    @PostMapping("/updateInfo")
    public String updateInfo(Student student, Professor professor, Admin admin) {
        LoginResponse user = (LoginResponse) httpSession.getAttribute("loginUser");
        if (user == null) {
            // 세션에 사용자가 없으면 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }
        Integer idUser = user.getIdUser();

        if (myPageService.isStudent(idUser)) {
            myPageService.updateStudent(student);
            return "redirect:/user/info";
        } else if (myPageService.isProfessor(idUser)) {
            myPageService.updateProfessor(professor);
            return "redirect:/user/info";
        } else if (myPageService.isAdmin(idUser)) {
            myPageService.updateAdmin(admin);
            return "redirect:/user/info";
        } else {
            return "/";
        }
    }

    @GetMapping("/deleteInfo")
    public String deleteInfo() {
        LoginResponse user = (LoginResponse) httpSession.getAttribute("loginUser");
        if (user == null) {
            // 세션에 사용자가 없으면 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }
        Integer idUser = user.getIdUser();

        if (myPageService.isStudent(idUser)) {
            return "/myPage/deleteInfo?idUser=" + idUser;
        } else if (myPageService.isProfessor(idUser)) {
            return "/myPage/deleteInfo?idUser=" + idUser;
        } else if (myPageService.isAdmin(idUser)) {
            return "/myPage/deleteInfo?idUser=" + idUser;
        } else {
            return "/";
        }
    }

    @PostMapping("/delete")
    public String delete() {
        LoginResponse user = (LoginResponse) httpSession.getAttribute("loginUser");
        if (user == null) {
            // 세션에 사용자가 없으면 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }
        Integer idUser = user.getIdUser();

        if (myPageService.isStudent(idUser)) {
            myPageService.deleteStudent(idUser);
            return "sample2";
        } else if (myPageService.isProfessor(idUser)) {
            myPageService.deleteProfessor(idUser);
            return "sample2";
        } else if (myPageService.isAdmin(idUser)) {
            myPageService.deleteAdmin(idUser);
            return "sample2";
        } else {
            return "/";
        }
    }
}
