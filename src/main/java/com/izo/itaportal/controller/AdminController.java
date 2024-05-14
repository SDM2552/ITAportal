package com.izo.itaportal.controller;

import com.izo.itaportal.model.Student;
import com.izo.itaportal.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    private StudentService studentService;

    @GetMapping("/studentList")
    public String Member(Model model){
        List<Student> students = studentService.getAllStudents();
        model.addAttribute("students", students);
        return "adminMember/studentList";
    }
}
