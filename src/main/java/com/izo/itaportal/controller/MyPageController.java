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
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/myPage")
public class MyPageController {


    @Autowired
    private MyPageService myPageService;

    @Autowired
    private HttpSession httpSession;

    //myPage/stuMyPage?idUser=2024
    @GetMapping("/stuMyPage")
    public String myPage(Model model,int idUser) {
        model.addAttribute("user", myPageService.getStudentById(idUser));
        return "/myPage/stuMyPage";
    }

    //myPage/profMyPage?idUser=1
    @GetMapping("/profMyPage")
    public String profMyPage(Model model,int idUser) {
        model.addAttribute("user", myPageService.getProfessorById(idUser));
        return "/myPage/profMyPage";
    }

    //myPage/adminMyPage?idUser=1234
    @GetMapping("/adminMyPage")
    public String adminMyPage(Model model,int idUser) {
        model.addAttribute("user", myPageService.getAdminById(idUser));
        return "/myPage/adminMyPage";
    }
}
