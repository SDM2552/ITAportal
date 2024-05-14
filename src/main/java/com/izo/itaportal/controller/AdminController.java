package com.izo.itaportal.controller;

import com.izo.itaportal.model.Professor;
import com.izo.itaportal.model.Student;
import com.izo.itaportal.service.ProfessorService;
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
    @Autowired
    private ProfessorService professorService;

    @GetMapping("/studentList") //학생 리스트 출력 페이지
    public String studentList(Model model){
        List<Student> students = studentService.getAllStudents();
        model.addAttribute("students", students);
        return "adminMember/studentList";
    }
    @GetMapping("/professorList") //강사 리스트 출력 페이지
    public String professorList(Model model){
        List<Professor> professors = professorService.getAllProfessors();
        model.addAttribute("professors", professors);
        return "adminMember/professorList";
    }
}
