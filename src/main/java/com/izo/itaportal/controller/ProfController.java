package com.izo.itaportal.controller;

import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.model.LoginResponse;
import com.izo.itaportal.model.Program;
import com.izo.itaportal.model.Schedule;
import com.izo.itaportal.model.Syllabus;
import com.izo.itaportal.service.ProfessorService;
import com.izo.itaportal.service.ScheduleService;
import com.izo.itaportal.service.SyllabusService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/prof")
@RequiredArgsConstructor
public class ProfController {

    private final SyllabusService syllabusService;
    private final ProfessorService professorService;
    private final ScheduleService scheduleService;

    @Autowired
    HttpSession session;

    //idProf 값을 저장함. 이후 매개변수에 @RequestParam("idPgm") int idPgm를 넣으면 세션 생성 없이 idProf를 쓸수있음
    @ModelAttribute("idProf")
    public int getIdProf(HttpSession session) {
        LoginResponse loginUser = (LoginResponse) session.getAttribute("loginUser");
        return loginUser.getCommonId();
    }

    // 교수별 강의리스트 조회
    // 로그인 구현 후 @RequestParam("idProf") int idProf 넣어야함
    @GetMapping("/list")
    public String getPrograms(Model model) {
        LoginResponse loginUser = (LoginResponse) session.getAttribute("loginUser");
        int idProf = loginUser.getCommonId();
        List<ProgramAllDto> pgms = professorService.selectAllPgmForProf(idProf);
        model.addAttribute("pgms", pgms);
        return "prof/list";
    }

    //강의 상세정보
    @GetMapping("/programDetails")
    public String programDetails(@RequestParam("idPgm") int idPgm, Model model, @ModelAttribute("idProf") int idProf) {
        ProgramAllDto programAllDto = professorService.selectPgmDetail(idProf, idPgm);
        System.out.println(programAllDto);
        model.addAttribute("ProgramDetail", programAllDto);
        return "prof/programDetails";
    }

    // 강의계획서 입력폼
    @GetMapping("/syllabus")
    public String syllabus(@RequestParam("idPgm") int idPgm, Model model) {
        System.out.println(idPgm);
        model.addAttribute("programInfo", syllabusService.selectJoinPgmByidPgm(idPgm));
        model.addAttribute("syllabus", syllabusService.selectSyllabus(idPgm));
        return "prof/syllabusInput";
    }

    // 강의계획서 입력 및 수정
    @PostMapping("/syllabus/input")
    @ResponseBody
    public Syllabus insertSyllabus(@RequestBody final Syllabus params) {
        Syllabus syllabus = syllabusService.selectSyllabus(params.getIdPgm());
        if (syllabus == null) {
            syllabusService.insertSyllabus(params);
        } else {
            syllabusService.updateSyllabus(params);
        }
        return syllabus;
    }

    //주차별 강의계획 입력폼
    @GetMapping("/schedule")
    public String schedule(@RequestParam("idPgm") int idPgm, Model model) {
        model.addAttribute("programInfo", syllabusService.selectJoinPgmByidPgm(idPgm));
        model.addAttribute("schedules", scheduleService.selectAllSchedule(idPgm));
        return "prof/scheduleInput";
    }

    //휴보강 페이지
    @GetMapping("/etc")
    public String classRequest(){
        return "prof/leaveProgram";
    }

    //출결 페이지
    @GetMapping("/attendance")
    public String attendance(@RequestParam("idPgm") int idPgm, Model model, @ModelAttribute("idProf") int idProf) {
        ProgramAllDto programAllDto = professorService.selectPgmDetail(idProf, idPgm);
        System.out.println(programAllDto);
        model.addAttribute("ProgramDetail", programAllDto);
        return "prof/attendance";
    }

    //과제 페이지
    @GetMapping("/examList")
    public String examList(){
        return "prof/examList";}
    
    //과제 상세 페이지
    @GetMapping("/examDetail")
    public String examDetail(){
        return "prof/examDetail";
    }
    //과제 생성 페이지
    @GetMapping("/new")
    public String examNew(){
        return "prof/examNew";
    }


    @PostMapping("schedule/input")
    @ResponseBody
    public void upsertSchedule(@RequestBody final List<Schedule> schedules) {
        scheduleService.upsertSchedule(schedules);
    }
}
