package com.izo.itaportal.controller;

//import com.izo.itaportal.service.AdminService;
import com.izo.itaportal.service.MyPageService;
import com.izo.itaportal.service.ProfessorService;
import com.izo.itaportal.service.StudentService;
import com.izo.itaportal.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class MyPageController {


    @Autowired
    private MyPageService myPageService;

    @Autowired
    HttpSession httpSession;

    @GetMapping("/stuMyPage")
    public String myPage(Model model,int idUser) {
        model.addAttribute("user", myPageService.getStudentById(idUser));
        return "stuMyPage";
    }

    @GetMapping("/profMyPage")
    public String profMyPage(Model model,int idUser) {
        model.addAttribute("user", myPageService.getProfessorById(idUser));
        return "profMyPage";
    }

    @GetMapping("/adminMyPage")
    public String adminMyPage(Model model,int idUser) {
        model.addAttribute("user", myPageService.getAdminById(idUser));
        return "adminMyPage";
    }
}
