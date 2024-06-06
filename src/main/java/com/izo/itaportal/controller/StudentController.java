package com.izo.itaportal.controller;

import com.izo.itaportal.dto.ExamDetailDto;
import com.izo.itaportal.dto.ExamListDto;
import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.dto.SugangDto;
import com.izo.itaportal.model.Exam;
import com.izo.itaportal.model.ExamSubmission;
import com.izo.itaportal.model.File;
import com.izo.itaportal.model.LoginResponse;
import com.izo.itaportal.service.ExamService;
import com.izo.itaportal.service.ExamSubmissionService;
import com.izo.itaportal.service.FileService;
import com.izo.itaportal.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(value = "/stu")
public class StudentController {
    @Autowired
    StudentService studentService;
    @Autowired
    ExamService examService;
    @Autowired
    FileService fileService;
    @Autowired
    ExamSubmissionService examSubmissionService;
    @Autowired
    HttpSession session;

    @GetMapping("/myProgram") //수강중인 강의 조회 페이지
    public String myProgram(Model model){
        LoginResponse loginUser = (LoginResponse) session.getAttribute("loginUser");
        int idStudent = loginUser.getCommonId();
        List<SugangDto> sugangDto = studentService.GetCourceList(idStudent);
        model.addAttribute("sugangList", sugangDto);
        System.out.println("수강: " + sugangDto);
        return "/student/myProgram";
    }
    @GetMapping("/program") //수강 내역 조회 페이지
    public String sugangList(Model model){
        LoginResponse loginUser = (LoginResponse) session.getAttribute("loginUser");
        int idStudent = loginUser.getCommonId();
        List<SugangDto> sugangDto = studentService.GetSugangList(idStudent);
        model.addAttribute("sugangList", sugangDto);
        System.out.println("수강: " + sugangDto);
        return "enrollment/enrollmentapplylist";
    }
    @GetMapping("/exam") //과제 리스트 페이지
    public String examPage(Model model){
        LoginResponse loginUser = (LoginResponse) session.getAttribute("loginUser");
        int idStudent = loginUser.getCommonId();
        List<ExamListDto> examList = examService.getExamsByStudentId(idStudent);
        model.addAttribute("examList", examList);
        return "student/exam";
    }
    @GetMapping("/examSubmit") //선택한 과제 제출 페이지
    public String examSubmit(@RequestParam("idExam") int idExam, Model model){
        ExamDetailDto examDetail = examService.getExamDetail(idExam);
        model.addAttribute("examDetail", examDetail);
        return "student/examSubmit";
    }
    @PostMapping("/submitExam")
    @Transactional
    public String submitExam(@RequestParam("idExam") int idExam,
                             @RequestParam("examFile") MultipartFile examFile,
                             @RequestParam("idProgram") int idProgram,
                             Model model) {
        LoginResponse loginUser = (LoginResponse) session.getAttribute("loginUser");
        int idStudent = loginUser.getCommonId();

        try {
            // 파일 저장
            fileService.saveFile(examFile, idExam, idStudent);
            // 파일 저장 후 idFile 가져오기
            File savedFile = fileService.getFileByExamAndStudent(idExam, idStudent);
            int idFile = savedFile.getIdFile();
            // 과제 제출 저장
            ExamSubmission examSubmission = new ExamSubmission();
            examSubmission.setIdProgram(idProgram);
            examSubmission.setIdExam(idExam);
            examSubmission.setIdStudent(idStudent);
            examSubmission.setIdFile(idFile);
            examSubmission.setExamStatus("Submitted");

            examSubmissionService.saveExamSubmission(examSubmission);

        } catch (IOException e) {
            model.addAttribute("message", "과제 제출 실패: " + e.getMessage());
        }
        return "redirect:/stu/exam";
}

    //수업디테일,강사디테일
    @GetMapping("/programView/{id}")
    public String programView(@PathVariable int id, Model model) {
        ProgramAllDto program = studentService.getProgramById(id);
        model.addAttribute("program", program);
        return "student/programView";
    }

    @GetMapping("/professorView/{id}")
    public String professorView(@PathVariable int id, Model model) {
        List<ProgramAllDto> professors = studentService.getProfessorsByProgramId(id);
        model.addAttribute("professors", professors);
        return "student/professorView";
    }
}
