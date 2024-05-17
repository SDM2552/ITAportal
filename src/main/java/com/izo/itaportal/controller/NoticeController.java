package com.izo.itaportal.controller;

import com.izo.itaportal.model.Notice;
import com.izo.itaportal.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
        ModelAndView modelAndView = new ModelAndView("adminProgram/noticeList");
        modelAndView.addObject("notices", notices);
        return modelAndView;
    }

    @GetMapping("/create")
    public ModelAndView showCreateForm() {
        ModelAndView modelAndView = new ModelAndView("adminProgram/stepCreateNotice");
        modelAndView.addObject("notice", new Notice());
        return modelAndView;
    }

    @PostMapping("/save")
    public String saveNotice(@ModelAttribute Notice notice) {
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

    @GetMapping("/edit/{idNotice}")
    public ModelAndView showEditForm(@PathVariable int idNotice) {
        Notice notice = noticeService.getNoticeById(idNotice);
        ModelAndView modelAndView = new ModelAndView("adminProgram/stepCreateNotice");
        modelAndView.addObject("notice", notice);
        return modelAndView;
    }

    @GetMapping("/delete/{idNotice}")
    public String deleteNotice(@PathVariable int idNotice) {
        noticeService.deleteNotice(idNotice);
        return "redirect:/notice/noticeList";
    }

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
    @GetMapping("/page/{pageNum}")
    public ModelAndView paginateNotices(@PathVariable int pageNum) {
        List<Notice> notices = noticeService.getNoticesByPage(pageNum);
        ModelAndView modelAndView = new ModelAndView("adminProgram/noticeList");
        modelAndView.addObject("notices", notices);
        return modelAndView;
    }
}
