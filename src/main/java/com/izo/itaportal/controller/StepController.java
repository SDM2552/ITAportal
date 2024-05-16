//package com.izo.itaportal.controller;
//
//import com.izo.itaportal.model.Notice;
//import com.izo.itaportal.model.User;
//import com.izo.itaportal.service.StepService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpSession;
//
//@Controller
//@RequestMapping("/step")
//public class StepController {
//
//    @Autowired
//    private StepService stepService;
//
//    // 사용자 등록
//    @PostMapping("/register")
//    public String registerStaff(@ModelAttribute User user, HttpSession session) {
//        user.setRole("admin");
//        stepService.registerStaff(user);
//        session.setAttribute("USER", user);
//        return "redirect:/step/login";  // 리다이렉트 경로
//    }
//
//    // 로그인 처리
//    @PostMapping("/login")
//    public String login(@ModelAttribute User user, HttpSession session) {
//        boolean isAuthenticated = stepService.authenticate(user);
//        if (isAuthenticated) {
//            session.setAttribute("USER", user);
//            return "redirect:/step/dashboard";  // 리다이렉트 경로
//        } else {
//            return "step/stepLogin";  // 뷰 이름 경로 수정
//        }
//    }
//
//    // 로그아웃 처리
//    @GetMapping("/logout")
//    public String logout(HttpSession session) {
//        session.invalidate();
//        return "redirect:/step/login";  // 리다이렉트 경로
//    }
//
//    // 대시보드 표시
//    @GetMapping("/dashboard")
//    public String dashboard(HttpSession session) {
//        if (session.getAttribute("USER") != null) {
//            return "step/stepDashboard";  // 뷰 이름 경로 수정
//        }
//        return "redirect:/step/login";  // 리다이렉트 경로
//    }
//
//    // 공지사항 목록
//    @GetMapping("/notices")
//    public String notices() {
//        return "step/stepNotices";  // 뷰 이름 경로 수정
//    }
//
//    // 공지사항 생성 폼
//    @GetMapping("/notice/create")
//    public String createNoticeForm() {
//        return "step/stepCreateNotice";  // 뷰 이름 경로 수정
//    }
//
//    // 공지사항 저장
//    @PostMapping("/notice/save")
//    public String createNotice(@ModelAttribute Notice notice) {
//        stepService.createNotice(notice);
//        return "redirect:/step/notices";  // 리다이렉트 경로
//    }
//
//    // 공지사항 편집 폼
//    @GetMapping("/notice/edit/{idNotice}")
//    public ModelAndView editNoticeForm(@PathVariable int idNotice) {
//        Notice notice = stepService.findNoticeById(idNotice);
//        ModelAndView mav = new ModelAndView("step/stepCreateNotice");  // 뷰 이름 경로 수정
//        mav.addObject("notice", notice);
//        return mav;
//    }
//
//    // 공지사항 업데이트
//    @PostMapping("/notice/update/{idNotice}")
//    public String updateNotice(@PathVariable int idNotice, @ModelAttribute Notice notice) {
//        stepService.updateNotice(idNotice, notice);
//        return "redirect:/step/notices";  // 리다이렉트 경로
//    }
//
//    // 메인 페이지
//    @GetMapping("/main")
//    public String staffMain() {
//        return "step/stepDashboard";  // 뷰 이름 경로 수정
//    }
//}
//
////package com.izo.itaportal.controller;
////
////import com.izo.itaportal.model.User;
////import com.izo.itaportal.model.Notice;
////import com.izo.itaportal.service.StepService;
////import org.springframework.beans.factory.annotation.Autowired;
////import org.springframework.http.ResponseEntity;
////import org.springframework.stereotype.Controller;
////import org.springframework.web.bind.annotation.*;
////import org.springframework.web.servlet.ModelAndView;
////
////import javax.servlet.http.HttpSession;
////
////@Controller
////@RequestMapping("/step")
////public class StepController {
////
////    @Autowired
////    private StepService stepService;
////
////    @PostMapping("/register")
////    public String registerStaff(@ModelAttribute User user, HttpSession session) {
////        user.setRole("admin");
////        stepService.registerStaff(user);
////        session.setAttribute("USER", user);
////        return "redirect:/step/login";
////    }
////
////    @PostMapping("/login")
////    public String login(@ModelAttribute User user, HttpSession session) {
////        boolean isAuthenticated = stepService.authenticate(user);
////        if (isAuthenticated) {
////            session.setAttribute("USER", user);
////            return "redirect:/step/dashboard";
////        } else {
////            return "login";
////        }
////    }
////
////    @GetMapping("/logout")
////    public String logout(HttpSession session) {
////        session.invalidate();
////        return "redirect:/step/login";
////    }
////
////    @GetMapping("/dashboard")
////    public String dashboard(HttpSession session) {
////        if (session.getAttribute("USER") != null) {
////            return "stepDashboard";
////        }
////        return "redirect:/step/login";
////    }
////
////    @GetMapping("/notices")
////    public String notices() {
////        return "stepNotices";
////    }
////
////    @GetMapping("/notice/create")
////    public String createNoticeForm() {
////        return "stepCreateNotice";
////    }
////
//////    @PostMapping("/notice/save")
//////    public ResponseEntity<String> createNotice(@ModelAttribute Notice notice) {
//////        stepService.createNotice(notice);
//////        return ResponseEntity.ok("Notice created successfully");
//////    }
////    @PostMapping("/notice/save")
////    public String createNotice(@ModelAttribute Notice notice) {
////        stepService.createNotice(notice);
////        return "redirect:/step/notices";
////    }
////
////
////    @GetMapping("/notice/edit/{idNotice}")
////    public ModelAndView editNoticeForm(@PathVariable int idNotice) {
////        Notice notice = stepService.findNoticeById(idNotice);
////        ModelAndView mav = new ModelAndView("stepCreateNotice");
////        mav.addObject("notice", notice);
////        return mav;
////    }
//////    @GetMapping("/notice/edit/{idNotice}")
//////    public String editNoticeForm(@PathVariable int idNotice) {
//////        return "stepCreateNotice";  // "editNotice"에서 "stepCreateNotice"로 변경
//////    }
////
////
//////    @PostMapping("/notice/update/{idNotice}")
//////    public ResponseEntity<String> updateNotice(@PathVariable int idNotice, @ModelAttribute Notice notice) {
//////        stepService.updateNotice(idNotice, notice);
//////        return ResponseEntity.ok("Notice updated successfully");
//////    }
////    @PostMapping("/notice/update/{idNotice}")
////    public String updateNotice(@PathVariable int idNotice, @ModelAttribute Notice notice) {
////        stepService.updateNotice(idNotice, notice);
////        return "redirect:/step/notices";
////    }
////
////    @GetMapping("/main")
////    public String staffMain() {
////        return "stepDashboard";
////    }
////}
////
//////package com.izo.itaportal.controller;
//////
//////import com.izo.itaportal.model.User;
//////import com.izo.itaportal.model.Notice;
//////import com.izo.itaportal.service.StepService;
//////import org.springframework.beans.factory.annotation.Autowired;
//////import org.springframework.http.ResponseEntity;
//////import org.springframework.stereotype.Controller;
//////import org.springframework.web.bind.annotation.*;
//////import org.springframework.web.servlet.ModelAndView;
//////
//////import javax.servlet.http.HttpSession;
//////
//////@Controller
//////@RequestMapping("/step")
//////public class StepController {
//////
//////    @Autowired
//////    private StepService stepService;
//////
//////    @PostMapping("/register")
//////    public String registerStaff(@ModelAttribute User user, HttpSession session) {
//////        user.setRole("admin");
//////        stepService.registerStaff(user);
//////        session.setAttribute("USER", user);
//////        return "redirect:/step/login";
//////    }
//////
//////    @PostMapping("/login")
//////    public String login(@ModelAttribute User user, HttpSession session) {
//////        boolean isAuthenticated = stepService.authenticate(user);
//////        if (isAuthenticated) {
//////            session.setAttribute("USER", user);
//////            return "redirect:/step/dashboard";
//////        } else {
//////            return "login";
//////        }
//////    }
//////
//////    @GetMapping("/logout")
//////    public String logout(HttpSession session) {
//////        session.invalidate();
//////        return "redirect:/step/login";
//////    }
//////
//////    @GetMapping("/dashboard")
//////    public String dashboard(HttpSession session) {
//////        if (session.getAttribute("USER") != null) {
//////            return "stepDashboard";
//////        }
//////        return "redirect:/step/login";
//////    }
//////
//////    @GetMapping("/notices")
//////    public String notices() {
//////        return "stepNotices";
//////    }
//////
//////    @GetMapping("/notice/create")
//////    public String createNoticeForm() {
//////        return "createNotice";
//////    }
//////
//////    @PostMapping("/notice")
//////    public ResponseEntity<String> createNotice(@ModelAttribute Notice notice) {
//////        stepService.createNotice(notice);
//////        return ResponseEntity.ok("Notice created successfully");
//////    }
//////
//////    @GetMapping("/notice/edit/{idNotice}")
//////    public String editNoticeForm(@PathVariable int idNotice) {
//////        return "editNotice";
//////    }
//////
//////    @PostMapping("/notice/update/{idNotice}")
//////    public ResponseEntity<String> updateNotice(@PathVariable int idNotice, @ModelAttribute Notice notice) {
//////        stepService.updateNotice(idNotice, notice);
//////        return ResponseEntity.ok("Notice updated successfully");
//////    }
//////
//////    @GetMapping("/main")
//////    public String staffMain() {
//////        return "stepMain";
//////    }
//////}