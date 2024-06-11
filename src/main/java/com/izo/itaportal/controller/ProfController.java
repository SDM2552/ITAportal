package com.izo.itaportal.controller;

import com.izo.itaportal.dto.*;
import com.izo.itaportal.model.*;
import com.izo.itaportal.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/prof")
@RequiredArgsConstructor
@Slf4j
public class ProfController {

    private final SyllabusService syllabusService;
    private final ProfessorService professorService;
    private final ScheduleService scheduleService;
    private final ClassRoomService classRoomService;

    @Autowired
    HttpSession session;
    @Autowired
    ExamService examService;
    @Autowired
    ExamSubmissionService examSubmissionService;

    //idProf 값을 저장함. 이후 매개변수에 @RequestParam("idProf") int idProf를 넣으면 세션 생성 없이 idProf를 쓸수있음
    @ModelAttribute("idProf")
    public int getIdProf(HttpSession session) {
        LoginResponse loginUser = (LoginResponse) session.getAttribute("loginUser");
        return loginUser.getCommonId();
    }

    // 교수별 강의리스트 조회
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

    //주차별 강의계획 입력폼 (교육 기간을 이용해 주수 계산하여 전달)
    @GetMapping("/schedule")
    public String schedule(@RequestParam("idPgm") int idPgm, Model model) {
        ProgramView programInfo = syllabusService.selectJoinPgmByidPgm(idPgm);
        model.addAttribute("maxIdSched",scheduleService.calculateWeekBetween(programInfo.getStDt(), programInfo.getEndDt()));
        model.addAttribute("programInfo", programInfo);
        model.addAttribute("schedules", scheduleService.selectAllSchedule(idPgm));
        return "prof/scheduleInput";
    }

    //주차별 강의계획 입력 및 수정
    @PostMapping("schedule/input")
    @ResponseBody
    public void upsertSchedule(@RequestBody final List<Schedule> schedules) {
        scheduleService.upsertSchedule(schedules);
    }

    //휴보강신청 폼
    @GetMapping("/request")
    public String classRequestForm(@RequestParam("idPgm") int idPgm, Model model){
        ProgramView programInfo = syllabusService.selectJoinPgmByidPgm(idPgm);
        long maxIdSched = scheduleService.calculateWeekBetween(programInfo.getStDt(),programInfo.getEndDt());
        List<ClassRoom> classRooms = classRoomService.getAllClassRoom();
        model.addAttribute("programInfo",programInfo);
        model.addAttribute("maxIdSched",maxIdSched);
        model.addAttribute("classRequest", professorService.selectClassRequest(idPgm));
        model.addAttribute("classRoom", classRooms);
        return "prof/requestProg";
    }

    //주차별 강의계획서상 강의 날짜 조회
    @PostMapping("/getDaySched")
    public ResponseEntity<String> getDayShced(@RequestParam int idSched, @RequestParam int idPgm){
        String daySched = scheduleService.selectScheduleByIdSched(idPgm, idSched);
        return ResponseEntity.ok(daySched);
    }

    //휴보강신청 등록
    @PostMapping("/classRequest")
    public String classRequest(ClassRequest classRequest, Model model){
        professorService.insertClassRequest(classRequest);
        model.addAttribute("idPgm", classRequest.getIdPgm());
        return "prof/list";
    }

    //출결 페이지
    @GetMapping("/attendance")
    public String attendanceForm(@RequestParam("idPgm") int idPgm, Model model, @ModelAttribute("idProf") int idProf) {
        ProgramAllDto programAllDto = professorService.selectPgmDetail(idProf, idPgm);
        List<AttendanceDto> attendanceDto = professorService.AttendanceStuList(idPgm);
        System.out.println(programAllDto);
        System.out.println(attendanceDto);
        model.addAttribute("ProgramDetail", programAllDto);
        model.addAttribute("attendanceList", attendanceDto);
        return "prof/attendance";
    }
    //출석 처리
    @PostMapping("/attendance")
    @ResponseBody
    @Transactional
    public ResponseEntity<String> attendance(@RequestParam("idPgm") int idPgm, @RequestParam("idStudent") int idStudent) {
        boolean isOkayd = professorService.attendance(idPgm, idStudent);
        if (isOkayd) {
            return ResponseEntity.ok("출석 처리 됐습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("출석 승인에 실패했습니다.");
        }
    }
    //지각 처리
    @PostMapping("/lateStatus")
    @ResponseBody
    @Transactional
    public ResponseEntity<String> lateStatus(@RequestParam("idPgm") int idPgm, @RequestParam("idStudent") int idStudent) {
        boolean isOkayd = professorService.lateStatus(idPgm, idStudent);
        if (isOkayd) {
            return ResponseEntity.ok("지각 처리 됐습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("지각 승인에 실패했습니다.");
        }
    }
    //결석 처리
    @PostMapping("/absenceStatus")
    @ResponseBody
    @Transactional
    public ResponseEntity<String> absenceStatus(@RequestParam("idPgm") int idPgm, @RequestParam("idStudent") int idStudent) {
        boolean isOkayd = professorService.absenceStatus(idPgm, idStudent);
        if (isOkayd) {
            return ResponseEntity.ok("결석 처리 됐습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("결석 승인에 실패했습니다.");
        }
    }

    //전체 과제 리스트 페이지
    @GetMapping("/examList")
    public String examList(Model model){
        LoginResponse loginUser = (LoginResponse) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/user/login";
        }
        int idProf = loginUser.getCommonId();
        List<ExamListDto> examListDtos = examService.getExamListByProfessor(idProf);
        model.addAttribute("ExamList", examListDtos);
        return "prof/examList";
    }
    
    //과제 상세 페이지
    @GetMapping("/examDetail")
    public String examDetail(@RequestParam("idExam") int idExam, Model model){
        ExamDetailDto examDetail = examService.getExamDetail(idExam);
        int idProgram = examDetail.getIdPgm();
        List<ExamSubmitDataDto> examSubmitData = examSubmissionService.getExamSubmitData(idExam, idProgram);
        model.addAttribute("examDetail", examDetail);
        model.addAttribute("examSubmitData", examSubmitData);
        return "prof/examDetail";
    }
    //과제 생성 페이지
    @GetMapping("/new")
    public String examNew(Model model){
        LoginResponse loginUser = (LoginResponse) session.getAttribute("loginUser");
        int idProf = loginUser.getCommonId();
        List<GetProgNameDto> getProgNameDtos = examService.getProgNameDtos(idProf);
        model.addAttribute("programs", getProgNameDtos);
        model.addAttribute("idProf",idProf);
        return "prof/examNew";
    }
    //과제 생성 로직
    @PostMapping("/makeExam")
    public String makeExam(@ModelAttribute Exam exam){
        LoginResponse loginUser = (LoginResponse) session.getAttribute("loginUser");
        int idProf = loginUser.getCommonId();
        exam.setIdProf(idProf);
        examService.insertExam(exam);
        return "redirect:/prof/examList";
    }
    //과제 평가 로직
    @PostMapping("/grading")
    public String grading(@RequestParam Map<String, String> allParams, Model model) {
        for (Map.Entry<String, String> entry : allParams.entrySet()) {
            String paramName = entry.getKey();
            String paramValue = entry.getValue();

            if (paramName.startsWith("score_")) {
                String[] parts = paramName.split("_");
                int idStudent = Integer.parseInt(parts[1]);
                int idPgm = Integer.parseInt(parts[2]);
                int score = Integer.parseInt(paramValue);
                //
                saveScore(idStudent, idPgm, score);
            }
        }
        return "redirect:/prof/examDetail";
    }

    private void saveScore(int idStudent, int idPgm, int score) {

    }



}
