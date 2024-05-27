package com.izo.itaportal.controller;

import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.dto.StudentInfoDto;
import com.izo.itaportal.model.Category;
import com.izo.itaportal.model.Enrollment;
import com.izo.itaportal.model.LoginResponse;
import com.izo.itaportal.model.Sugang;
import com.izo.itaportal.service.CategoryService;
import com.izo.itaportal.service.StudentService;
import com.izo.itaportal.service.SugangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/program")
public class SugangController {
    @Autowired
    SugangService sugangService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    StudentService studentService;
    @Autowired
    HttpSession session;

    @GetMapping("/list") //수강신청 목록 페이지
    public String programList(Model model){
        List<ProgramAllDto> programs = sugangService.getAllProgram();
        System.out.println("출력"+programs.toString());
        model.addAttribute("programs", programs);
        List<Category> categories = categoryService.getAllCategory();
        model.addAttribute("categories",categories);

        return "sugang/sugangList";
    }

    @GetMapping("/applyForm") //수강신청 개별과목 정보 페이지
    public String applyForm(@RequestParam("id") int programId, Model model) {
        LoginResponse loginUser = (LoginResponse) session.getAttribute("loginUser");
        int idUser = loginUser.getIdUser();
        ProgramAllDto program = sugangService.getProgramDetail(programId);
        System.out.println("프로그램 정보:"+program.toString());
        model.addAttribute("program", program);
        StudentInfoDto studentInfoDto = studentService.getStudentInfo(idUser);
        model.addAttribute("studentInfo",studentInfoDto);
        return "sugang/sugangDetail";
    }

    @PostMapping("/result") //수강신청 처리
    public String sugang(@RequestBody Sugang sugang){
        int commonId = sugang.getCommonId();
        int idPgm = sugang.getIdPgm();
        int idCate = sugang.getIdCate();
        System.out.println("idcate값: "+idCate);
        sugangService.applyEnrollmentRequest(commonId, idPgm, idCate);
        return "sugang/sugangSuccess";
    }
    @GetMapping("/result") //수강신청 결과 페이지
    public String sugang2(){
        return "sugang/sugangSuccess";
    }
    @PostMapping("/cancelSugang")
    @ResponseBody
    public ResponseEntity<String> cancelEnrollment(@RequestParam("idPgm") int idPgm) {
        LoginResponse loginUser = (LoginResponse) session.getAttribute("loginUser");
        int idStudent = loginUser.getCommonId();
        boolean isCancelled = sugangService.cancelSugang(idPgm, idStudent);
        if (isCancelled) {
            return ResponseEntity.ok("수강이 취소되었습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("수강 취소에 실패했습니다.");
        }
    }
}

