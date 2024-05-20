package com.izo.itaportal.controller;

import com.izo.itaportal.model.Notice;
import com.izo.itaportal.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Comparator;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @GetMapping("/list")
    public String listNotices() {
        return "adminProgram/noticeList";
    }

    @GetMapping("/noticeList")
    public ModelAndView showNoticeList() {
        List<Notice> notices = noticeService.getAllNotices();
        Comparator<Notice> comparator = Comparator.comparing(Notice::getIdNotice).reversed();
        notices.sort(comparator);
        ModelAndView modelAndView = new ModelAndView("adminProgram/noticeList");
        modelAndView.addObject("notices", notices);
        return modelAndView;
    }

    //공지사항작성 common_id=admin
    @GetMapping("/create")
    public ModelAndView showCreateForm(HttpSession session) {
        if (!isAdmin(session)) {
            return new ModelAndView("error/403");
        }
        ModelAndView modelAndView = new ModelAndView("adminProgram/stepCreateNotice");
        modelAndView.addObject("notice", new Notice());
        return modelAndView;
    }
//    @GetMapping("/create")
//    public ModelAndView showCreateForm() {
//        ModelAndView modelAndView = new ModelAndView("adminProgram/stepCreateNotice");
//        modelAndView.addObject("notice", new Notice());
//        return modelAndView;
//    }


    //공지사항 저장 common_id=admin이 아니면 에러
    @PostMapping("/save")
    public String saveNotice(@ModelAttribute Notice notice, HttpSession session) {
        if (!isAdmin(session)) {
            return "error/403";
        }
        if (notice.getIdNotice() != 0) {  // 0이 아닌 경우 업데이트
            Notice existingNotice = noticeService.getNoticeById(notice.getIdNotice());
            notice.setCreatedDate(existingNotice.getCreatedDate());  // 기존 작성 날짜 유지
            notice.setViews(existingNotice.getViews());  // 기존 조회수 유지
            noticeService.updateNotice(notice.getIdNotice(), notice);
        } else {  // 0인 경우 새로 생성
            String createdDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            notice.setCreatedDate(createdDate);
            noticeService.createNotice(notice);
        }
        return "redirect:/notice/noticeList";
    }
//    @PostMapping("/save")
//    public String saveNotice(@ModelAttribute Notice notice) {
//        if (notice.getIdNotice() != 0) {  // 0이 아닌 경우 업데이트
//            Notice existingNotice = noticeService.getNoticeById(notice.getIdNotice());
//            notice.setCreatedDate(existingNotice.getCreatedDate());  // 기존 작성 날짜 유지
//            notice.setViews(existingNotice.getViews());  // 기존 조회수 유지
//            noticeService.updateNotice(notice.getIdNotice(), notice);
//        } else {  // 0인 경우 새로 생성
//            String createdDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
//            notice.setCreatedDate(createdDate);
//            noticeService.createNotice(notice);
//        }
//        return "redirect:/notice/noticeList";
//    }

    //공지사항 수정
    @GetMapping("/edit/{idNotice}")
    public ModelAndView showEditForm(@PathVariable int idNotice, HttpSession session) {
        if (!isAdmin(session)) {
            return new ModelAndView("error/403");
        }
        Notice notice = noticeService.getNoticeById(idNotice);
        ModelAndView modelAndView = new ModelAndView("adminProgram/stepCreateNotice");
        modelAndView.addObject("notice", notice);
        return modelAndView;
    }
//    @GetMapping("/edit/{idNotice}")
//    public ModelAndView showEditForm(@PathVariable int idNotice) {
//        Notice notice = noticeService.getNoticeById(idNotice);
//        ModelAndView modelAndView = new ModelAndView("adminProgram/stepCreateNotice");
//        modelAndView.addObject("notice", notice);
//        return modelAndView;
//    }

    //삭제
    @GetMapping("/delete/{idNotice}")
    public String deleteNotice(@PathVariable int idNotice, HttpSession session) {
        if (!isAdmin(session)) {
            return "error/403";
        }
        noticeService.deleteNotice(idNotice);
        return "redirect:/notice/noticeList";
    }
//    @GetMapping("/delete/{idNotice}")
//    public String deleteNotice(@PathVariable int idNotice) {
//        noticeService.deleteNotice(idNotice);
//        return "redirect:/notice/noticeList";
//    }

    // 공지사항 상세 조회 기능 추가
    @GetMapping("/view/{idNotice}")
    public ModelAndView viewNotice(@PathVariable int idNotice) {
        Notice notice = noticeService.getNoticeById(idNotice);
        ModelAndView modelAndView = new ModelAndView("adminProgram/viewNotice");
        modelAndView.addObject("notice", notice);
        return modelAndView;
    }

    // 공지사항 검색 기능 추가
    @GetMapping("/search")
    public ModelAndView searchNotices(@RequestParam("keyword") String keyword) {
        List<Notice> notices = noticeService.searchNoticesByKeyword(keyword);
        ModelAndView modelAndView = new ModelAndView("adminProgram/noticeList");
        modelAndView.addObject("notices", notices);
        return modelAndView;
    }

    // 공지사항 페이지 이동 기능 추가
//    @GetMapping("/page/{pageNum}")
//    public ModelAndView paginateNotices(@PathVariable int pageNum) {
//        List<Notice> notices = noticeService.getNoticesByPage(pageNum);
//        ModelAndView modelAndView = new ModelAndView("adminProgram/noticeList");
//        modelAndView.addObject("notices", notices);
//        return modelAndView;
//    }
    // 공지사항 페이지 이동 기능 추가
    @GetMapping("/page/{pageNum}")
    public ModelAndView paginateNotices(@PathVariable int pageNum) {
        List<Notice> notices = noticeService.getNoticesByPage(pageNum);
        int totalNotices = noticeService.getTotalNotices(); // 총 공지사항 수를 가져오는 메서드
        int totalPages = (int) Math.ceil(totalNotices / 10.0); // 총 페이지 수 계산

        ModelAndView modelAndView = new ModelAndView("adminProgram/noticeList");
        modelAndView.addObject("notices", notices);
        modelAndView.addObject("totalPages", totalPages);
        modelAndView.addObject("currentPage", pageNum);
        return modelAndView;
    }

//
    private boolean isAdmin(HttpSession session) {
        if (session.getAttribute("loginUser") == null) {
            return false;
        }
        String role = (String) session.getAttribute("role");
        return "admin".equals(role);
    }
}
