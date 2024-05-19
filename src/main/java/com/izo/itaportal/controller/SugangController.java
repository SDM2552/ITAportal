package com.izo.itaportal.controller;

import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.model.Enrollment;
import com.izo.itaportal.model.Sugang;
import com.izo.itaportal.service.SugangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/program")
public class SugangController {
    @Autowired
    SugangService sugangService;

    @GetMapping("/list") //수강신청 목록 페이지
    public String programList(Model model){
        List<ProgramAllDto> programs = sugangService.getAllProgram();
        System.out.println("출력"+programs.toString());
        model.addAttribute("programs", programs);
        return "sugang/sugangList";
    }

    @GetMapping("/applyForm") //수강신청 개별과목 정보 페이지
    public String applyForm(@RequestParam("id") int programId, Model model) {
        ProgramAllDto program = sugangService.getProgramDetail(programId);
        model.addAttribute("program", program);
        return "sugang/sugangDetail";
    }

    @PostMapping("/result")
    public String sugang(@RequestBody Sugang sugang){
        int idUser = sugang.getIdUser();
        int idPgm = sugang.getIdPgm();
        sugangService.applyEnrollmentRequest(idUser, idPgm);
        return "redirect:/program/result";
    }
    @GetMapping("/result")
    public String sugang2(){
        return "sugang/sugangSuccess";
    }

}
