package com.izo.itaportal.controller;


import com.izo.itaportal.model.Admin;
import com.izo.itaportal.model.Professor;
import com.izo.itaportal.model.Student;
import com.izo.itaportal.service.MyPageService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class MyPageController {


    @Autowired
    private MyPageService myPageService;

    @Autowired
    private HttpSession httpSession;

    //학생  user/info?idUser=2024
    //교수  user/info?idUser=1
    //관리자 user/info?idUser=1234
    @GetMapping("/info")
    public String myPage(Model model, Integer idUser) {
        if (myPageService.isStudent(idUser)) {
            model.addAttribute("user", myPageService.getStudentById(idUser));
            return "/myPage/stuMyPage";
        } else if (myPageService.isProfessor(idUser)) {
            model.addAttribute("user", myPageService.getProfessorById(idUser));
            return "/myPage/profMyPage";
        } else if (myPageService.isAdmin(idUser)) {
            model.addAttribute("user", myPageService.getAdminById(idUser));
            return "/myPage/adminMyPage";
        } else {
            return "/";
        }
    }

    @PostMapping("/updateInfo")
    public String updateInfo(Integer idUser, Student student, Professor professor, Admin admin) {

        if (myPageService.isStudent(idUser)) {
            myPageService.updateStudent(student);
            return "redirect:/user/info?idUser=" + student.getIdUser();
        } else if (myPageService.isProfessor(idUser)) {
            myPageService.updateProfessor(professor);
            return "redirect:/user/info?idUser=" + professor.getIdUser();
        } else if (myPageService.isAdmin(idUser)) {
            myPageService.updateAdmin(admin);
            return "redirect:/user/info?idUser=" + admin.getIdUser();
        } else {
            return "/";
        }
    }

    @GetMapping("/deleteInfo")
    public String deleteInfo(Integer idUser, Student student, Professor professor, Admin admin) {

        if (myPageService.isStudent(idUser)) {

            return "/myPage/deleteInfo?idUser=" + student.getIdUser();
        } else if (myPageService.isProfessor(idUser)) {

            return "/myPage/deleteInfo?idUser=" + professor.getIdUser();
        } else if (myPageService.isAdmin(idUser)) {

            return "/myPage/deleteInfo?idUser=" + admin.getIdUser();
        } else {
            return "/";
        }

    }

    @PostMapping("/delete")
    public String delete(Integer idUser) {
        if (myPageService.isStudent(idUser)) {
            myPageService.deleteStudent(idUser);
            return "sample2";
        } else if (myPageService.isProfessor(idUser)) {
            myPageService.deleteProfessor(idUser);
            return "sample2";
        } else if (myPageService.isAdmin(idUser)) {
            myPageService.deleteAdmin(idUser);
            return "sample2";
        } else {
            return "/";
        }
    }


//    @GetMapping("/stuMyPage")
//    public String stuMyPage(Model model, @RequestParam Integer idUser) {
//        model.addAttribute("user", myPageService.getStudentById(idUser));
//        return "/myPage/stuMyPage";
//    }
//
//    @PostMapping("/updateStuInfo")
//    public String updateStuInfo(Student student) {
//        myPageService.updateStudent(student);
//
//        return "redirect:/user/stuMyPage?idUser=" + student.getIdUser();
//    }


    ////myPage/profMyPage?idUser=1
//@GetMapping("/profMyPage")
//public String profMyPage(Model model, int idUser) {
//    model.addAttribute("user", myPageService.getProfessorById(idUser));
//    return "/myPage/profMyPage";
//}
//
////myPage/adminMyPage?idUser=1234
//@GetMapping("/adminMyPage")
//public String adminMyPage(Model model, int idUser) {
//    model.addAttribute("user", myPageService.getAdminById(idUser));
//    return "/myPage/adminMyPage";
//}
}
