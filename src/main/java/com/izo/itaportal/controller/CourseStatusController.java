package com.izo.itaportal.controller;

import com.izo.itaportal.model.Program;
import com.izo.itaportal.service.CourseStatusService;
import com.izo.itaportal.service.ProgramService;
import com.izo.itaportal.service.SugangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/courseStatus")
public class CourseStatusController {
    @Autowired
    private CourseStatusService courseStatusService;
    @Autowired
    ProgramService programService;
    @Autowired
    SugangService sugangService;

    @GetMapping("/list")
    public String CourseList(Model model) {
//        model.addAttribute("prog", programService.getAllPrograms());
        model.addAttribute("sugangList",sugangService.getAllSugang());
        return "/adminProgram/courseStatus";
    }

    @GetMapping("/{idPgm}")
    public ResponseEntity<Program> getStartDateById(@PathVariable int idPgm) {
        Program program= courseStatusService.selectProgramByIdPgm(idPgm);
        return ResponseEntity.ok(program);
    }


}
