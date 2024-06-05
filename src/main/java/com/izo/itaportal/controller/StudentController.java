package com.izo.itaportal.controller;

import com.izo.itaportal.dto.ExamDetailDto;
import com.izo.itaportal.dto.ExamListDto;
import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.dto.SugangDto;
import com.izo.itaportal.model.Exam;
import com.izo.itaportal.model.LoginResponse;
import com.izo.itaportal.service.ExamService;
import com.izo.itaportal.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/stu")
public class StudentController {
    @Autowired
    StudentService studentService;
    @Autowired
    ExamService examService;
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
