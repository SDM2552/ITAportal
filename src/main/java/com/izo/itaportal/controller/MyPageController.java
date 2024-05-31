package com.izo.itaportal.controller;


import com.izo.itaportal.model.*;
import com.izo.itaportal.service.MyPageService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class MyPageController {

    @Autowired
    private MyPageService myPageService;

    @Autowired
    private HttpSession httpSession;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/info")
    public String myPage(Model model) {
        LoginResponse user = (LoginResponse) httpSession.getAttribute("loginUser");
        if (user == null) {
            // 세션에 사용자가 없으면 로그인 페이지로 리다이렉트
            return "redirect:/user/login";
        }
        Integer idUser = user.getIdUser();
        model.addAttribute("member", myPageService.getUserById(idUser));

        String birthDate = null;



        if (myPageService.isStudent(idUser)) {
            Student student = myPageService.getStudentById(idUser);
            model.addAttribute("user", student);
            birthDate = student.getBirth();
        } else if (myPageService.isProfessor(idUser)) {
            Professor professor = myPageService.getProfessorById(idUser);
            model.addAttribute("user", professor);
            birthDate = professor.getBirth();
        } else if (myPageService.isAdmin(idUser)) {
            Admin admin = myPageService.getAdminById(idUser);
            model.addAttribute("user", admin);
            birthDate = admin.getBirth();
        } else {
            return "/user/signIn";
        }
        if (birthDate != null && birthDate.length() == 8) {
            String birthYear = birthDate.substring(0, 4);
            String birthMonth = birthDate.substring(4, 6);
            String birthDay = birthDate.substring(6, 8);

            model.addAttribute("birthYear", birthYear);
            model.addAttribute("birthMonth", birthMonth);
            model.addAttribute("birthDay", birthDay);
        } else {
            model.addAttribute("birthYear", "");
            model.addAttribute("birthMonth", "");
            model.addAttribute("birthDay", "");
        }


        return "/myPage/myPage";
    }

    @PostMapping("/updateInfo")
    public ResponseEntity<Map<String, Object>> updateInfo(Student student, Professor professor, Admin admin, User user1) {
        Map<String, Object> response = new HashMap<>();
        LoginResponse user = (LoginResponse) httpSession.getAttribute("loginUser");
        if (user == null) {
            response.put("success", false);
            response.put("error", "로그인이 필요합니다.");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }

        Integer idUser = user.getIdUser();

        try {
            if (myPageService.isStudent(idUser)) {
                myPageService.updateStudent(student);
            } else if (myPageService.isProfessor(idUser)) {
                myPageService.updateProfessor(professor);
            } else if (myPageService.isAdmin(idUser)) {
                myPageService.updateAdmin(admin);
            } else {
                response.put("success", false);
                response.put("error", "유효하지 않은 사용자입니다.");
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
            }
            response.put("success", true);
            response.put("message", "정보가 성공적으로 업데이트되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("error", "업데이트 중 오류가 발생했습니다.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }


    @GetMapping("/deleteInfo")
    public String deleteInfo() {
        LoginResponse user = (LoginResponse) httpSession.getAttribute("loginUser");
        if (user == null) {
            // 세션에 사용자가 없으면 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }
        Integer idUser = user.getIdUser();

        if (myPageService.isStudent(idUser)) {
            return "/myPage/deleteInfo";
        } else if (myPageService.isProfessor(idUser)) {
            return "/myPage/deleteInfo";
        } else if (myPageService.isAdmin(idUser)) {
            return "/myPage/deleteInfo";
        } else {
            return "/";
        }
    }


    @GetMapping("/passwordUpdateInput")
    public String passwordUpdateInput(Model model) {
        LoginResponse user = (LoginResponse) httpSession.getAttribute("loginUser");

        if (user == null) {
            return "redirect:/login";
        }
        return "/myPage/passwordUpdateInput";
    }

    @PostMapping("/passwordUpdate")
    @ResponseBody
    public ResponseEntity<Map<String, String>> updatePassword(String currentPassword, String newPassword, String confirmPassword) {
        Map<String, String> response = new HashMap<>();
        LoginResponse user = (LoginResponse) httpSession.getAttribute("loginUser");

        if (user == null) {
            response.put("error", "로그인 상태가 아닙니다.");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }

        if (!newPassword.equals(confirmPassword)) {
            response.put("error", "새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }

        String encodedCurrentPassword = user.getPassword();
        if (!passwordEncoder.matches(currentPassword, encodedCurrentPassword)) {
            response.put("error", "현재 비밀번호가 일치하지 않습니다.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }

        boolean isUpdated = myPageService.updatePassword(user.getIdUser(), newPassword);
        if (!isUpdated) {
            response.put("error", "비밀번호 업데이트에 실패했습니다.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }

        response.put("success", "비밀번호가 성공적으로 변경되었습니다.\n다시 로그인해 주세요");
        httpSession.invalidate();
        return ResponseEntity.ok(response);

    }





    @GetMapping("/delete2")
    public String delete() {
        LoginResponse user = (LoginResponse) httpSession.getAttribute("loginUser");

        Integer idUser = user.getIdUser();

        if (myPageService.isStudent(idUser)) {
            myPageService.deleteStudent(idUser);
            myPageService.deleteUser(idUser);       //외래묶으면 삭제
            httpSession.invalidate();
            return "redirect:/";
        } else if (myPageService.isProfessor(idUser)) {
            myPageService.deleteProfessor(idUser);
            myPageService.deleteUser(idUser);
            httpSession.invalidate();
            return "redirect:/";
        } else if (myPageService.isAdmin(idUser)) {
            myPageService.deleteAdmin(idUser);
            myPageService.deleteUser(idUser);
            httpSession.invalidate();
            return "redirect:/";
        } else {
            return "/";
        }

    }
}
