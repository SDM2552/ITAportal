package com.izo.itaportal.controller;

import com.izo.itaportal.model.Notice;
import com.izo.itaportal.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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
            noticeService.updateNotice(notice.getIdNotice(), notice);
        } else {  // 0인 경우 새로 생성
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
}