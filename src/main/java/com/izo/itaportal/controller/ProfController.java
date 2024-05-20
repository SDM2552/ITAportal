package com.izo.itaportal.controller;

import com.izo.itaportal.model.Program;
import com.izo.itaportal.model.Schedule;
import com.izo.itaportal.model.Syllabus;
import com.izo.itaportal.service.ProfessorService;
import com.izo.itaportal.service.ScheduleService;
import com.izo.itaportal.service.SyllabusService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/prof")
@RequiredArgsConstructor
public class ProfController {

    private final SyllabusService syllabusService;
    private final ProfessorService professorService;
    private final ScheduleService scheduleService;

    // 교수별 강의리스트 조회
    // 로그인 구현 후 @RequestParam("idProf") int idProf 넣어야함
    @GetMapping("/list")
    public String getPrograms(Model model){
        int idProf = 1;
        List<Program> pgms = professorService.selectPgmForProf(idProf);
        model.addAttribute("pgms", pgms);
        return "prof/list";
    }
    
    // 강의계획서 입력폼
    @GetMapping("/syllabus")
    public String syllabus(@RequestParam("idPgm") int idPgm, Model model){
        System.out.println(idPgm);
        model.addAttribute("programInfo", syllabusService.selectJoinPgmByidPgm(idPgm));
        model.addAttribute("syllabus", syllabusService.selectSyllabus(idPgm));
        return "prof/syllabusInput";
    }

    // 강의계획서 입력 및 수정
    @PostMapping("/syllabus/input")
    @ResponseBody
    public Syllabus insertSyllabus(@RequestBody final Syllabus params){
        Syllabus syllabus = syllabusService.selectSyllabus(params.getIdPgm());
        if(syllabus == null){
            syllabusService.insertSyllabus(params);
        } else {
            syllabusService.updateSyllabus(params);
        }
        return syllabus;
    }

    //주차별 강의계획 입력폼
    @GetMapping("/schedule")
    public String schedule(@RequestParam("idPgm") int idPgm, Model model){
        model.addAttribute("programInfo", syllabusService.selectJoinPgmByidPgm(idPgm));
        model.addAttribute("schedules", scheduleService.selectAllSchedule(idPgm));
        return "prof/scheduleInput";
    }

    @PostMapping("schedule/input")
    @ResponseBody
    public void upsertSchedule(@RequestBody final List<Schedule> schedules){
        scheduleService.upsertSchedule(schedules);
    }
}
