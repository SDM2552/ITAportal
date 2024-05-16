package com.izo.itaportal.controller;

//import com.izo.itaportal.service.AdminService;
import com.izo.itaportal.service.ProfessorService;
import com.izo.itaportal.service.StudentService;
import com.izo.itaportal.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {


    @Autowired
    private ProfessorService professorService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private UserService userService;

    @GetMapping("/stuMyPage")
    public String myPage(Model model) {

        model.addAttribute("user", studentService.getAllStudents());
        return "stuMyPage";
    }
}
