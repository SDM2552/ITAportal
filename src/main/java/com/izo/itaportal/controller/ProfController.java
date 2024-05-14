package com.izo.itaportal.controller;

import com.izo.itaportal.model.Syllabus;
import com.izo.itaportal.service.SyllabusService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/prof")
@RequiredArgsConstructor
public class ProfController {

    private final SyllabusService syllabusService;

    @GetMapping("/list")
    public String classList(){
        //Program select
        return "";
    }
    @GetMapping("/syllabus")
    public String syllabus(Model model){
        //이미 작성된 강의계획서가 있다면(select) 불러와서 출력
        return "syllabus/input";
    }

    @PostMapping("/syllabus/{idProf}/input")
    public String insertSyllabus(Syllabus syllabus){
        syllabusService.insertSyllabus(syllabus);
        return "";
    }
}
