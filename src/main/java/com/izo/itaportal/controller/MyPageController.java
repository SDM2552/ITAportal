package com.izo.itaportal.controller;


import com.izo.itaportal.model.*;
import com.izo.itaportal.service.MyPageService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


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
            return "redirect:/login";
        }
        Integer idUser = user.getIdUser();
        model.addAttribute("member", myPageService.getUserById(idUser));

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
            return "/user/signIn";
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
        System.out.println("!@#$!@#$"+user.getIdUser());
        System.out.println("!@#$!@#$"+currentPassword);
        System.out.println("!@#$!@#$"+newPassword);
        boolean isUpdated = myPageService.updatePassword(user.getIdUser(), currentPassword, newPassword);
        if (!isUpdated) {
            response.put("error", "비밀번호 업데이트에 실패했습니다.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }

        response.put("success", "비밀번호가 성공적으로 변경되었습니다.");
        return ResponseEntity.ok(response);
    }
//    @PostMapping("/passwordUpdate")
//    public String updatePassword(String currentPassword, String newPassword, String confirmPassword, Model model) {
//        LoginResponse user = (LoginResponse) httpSession.getAttribute("loginUser");
//
//        if (user == null) {
//            return "redirect:/";
//        }
//
//        if (!newPassword.equals(confirmPassword)) {
//            model.addAttribute("error", "새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.");
//            return "redirect:/user/passwordUpdateInput";
//        }
//
//        // 비밀번호를 암호화하여 비교합니다.
//        String encodedCurrentPassword = user.getPassword();
//        if (!passwordEncoder.matches(currentPassword, encodedCurrentPassword)) {
//            model.addAttribute("error", "현재 비밀번호가 일치하지 않습니다.");
//            return "redirect:/user/passwordUpdateInput";
//        }
//
//        boolean isUpdated = myPageService.updatePassword(user.getIdUser(), currentPassword, newPassword);
//        if (!isUpdated) {
//            model.addAttribute("error", "비밀번호 업데이트에 실패했습니다.");
//            return "redirect:/user/passwordUpdateInput";
//        }
//
//        return "redirect:/user/info";
//    }

    @PostMapping("/updateInfo")
    public String updateInfo(Student student, Professor professor, Admin admin, User user1) {
        LoginResponse user = (LoginResponse) httpSession.getAttribute("loginUser");
        if (user == null) {
            // 세션에 사용자가 없으면 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }
        Integer idUser = user.getIdUser();


        if (myPageService.isStudent(idUser)) {
            myPageService.updateStudent(student);
            return "redirect:/user/info";
        } else if (myPageService.isProfessor(idUser)) {
            myPageService.updateProfessor(professor);
            return "redirect:/user/info";
        } else if (myPageService.isAdmin(idUser)) {
            myPageService.updateAdmin(admin);
            return "redirect:/user/info";
        } else {
            return "/";
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

    @GetMapping("/delete")
    public String delete() {
        LoginResponse user = (LoginResponse) httpSession.getAttribute("loginUser");
        if (user == null) {
            // 세션에 사용자가 없으면 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }
        Integer idUser = user.getIdUser();

        if (myPageService.isStudent(idUser)) {
            myPageService.deleteStudent(idUser);
            myPageService.deleteUser(idUser);       //외래묶으면 삭제
            return "redirect:/";
        } else if (myPageService.isProfessor(idUser)) {
            myPageService.deleteProfessor(idUser);
            myPageService.deleteUser(idUser);
            return "redirect:/";
        } else if (myPageService.isAdmin(idUser)) {
            myPageService.deleteAdmin(idUser);
            myPageService.deleteUser(idUser);
            return "redirect:/";
        } else {
            return "/";
        }
    }
}
