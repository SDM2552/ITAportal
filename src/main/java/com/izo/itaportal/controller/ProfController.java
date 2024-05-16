package com.izo.itaportal.controller;

import com.izo.itaportal.model.Program;
import com.izo.itaportal.model.Syllabus;
import com.izo.itaportal.model.SyllabusRequest;
import com.izo.itaportal.service.ProfessorService;
import com.izo.itaportal.service.SyllabusService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/prof")
@RequiredArgsConstructor
public class ProfController {

    private final SyllabusService syllabusService;
    private final ProfessorService professorService;

    // 교수별 강의리스트 조회
    // 로그인 구현 후 @RequestParam("idProf") int idProf 넣어야함
    @GetMapping("/list")
    public String getPrograms(Model model){
        int idProf = 1;
        List<Program> pgms = professorService.selectPgmForProf(idProf);
        model.addAttribute("pgms", pgms);
        return "syllabus/list";
    }
    
    // 강의계획서 입력폼
    @GetMapping("/syllabus")
    public String syllabus(Model model, SyllabusRequest req){
        model.addAttribute("syllabus",syllabusService.selectSyllabus(req));
        return "syllabus/input";
    }

    // 강의계획서 입력
    @PostMapping("/syllabus/{idProf}/input")
    public String insertSyllabus(Syllabus syllabus){
        syllabusService.insertSyllabus(syllabus);
        return "";
    }
}
