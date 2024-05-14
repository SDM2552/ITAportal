package com.izo.itaportal.controller;

import com.izo.itaportal.model.Syllabus;
import com.izo.itaportal.model.SyllabusRequest;
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

    @GetMapping("/{idProf}/list") //list뜨면 @RequestParam으로 받아오기
    public String classList(){
        //Program select
        return "";
    }
    @GetMapping("/syllabus")
    public String syllabus(Model model, SyllabusRequest req){
        model.addAttribute("syllabus",syllabusService.selectSyllabus(req));
        return "syllabus/input";
    }

    @PostMapping("/syllabus/{idProf}/input")
    public String insertSyllabus(Syllabus syllabus){
        syllabusService.insertSyllabus(syllabus);
        return "";
    }
}
