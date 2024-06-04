package com.izo.itaportal.controller;

import com.izo.itaportal.model.Notice;
import com.izo.itaportal.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
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
    public String showNoticeList(@RequestParam(value = "keyword", required = false) String keyword, @RequestParam(value = "page", defaultValue = "1") int pageNum, Model model) {
        List<Notice> notices;
        int totalPages;

        if (keyword != null && !keyword.isEmpty()) {
            notices = noticeService.getNoticesByPageWithKeyword(pageNum, keyword);
            totalPages = (int) Math.ceil((double) noticeService.getTotalNoticesByKeyword(keyword) / 10);
        } else {
            notices = noticeService.getNoticesByPage(pageNum);
            totalPages = (int) Math.ceil((double) noticeService.getTotalNotices() / 10);
        }

        model.addAttribute("notices", notices);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", pageNum);
        model.addAttribute("keyword", keyword);

        return "adminProgram/noticeList";
    }

    // 공지사항 작성
    @GetMapping("/create")
    public ModelAndView showCreateForm(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("adminProgram/stepCreateNotice");
        modelAndView.addObject("notice", new Notice());
        return modelAndView;
    }

    // 공지사항 저장
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

    // 공지사항 수정
    @GetMapping("/edit/{idNotice}")
    public ModelAndView showEditForm(@PathVariable int idNotice, HttpSession session) {
        Notice notice = noticeService.getNoticeById(idNotice);
        ModelAndView modelAndView = new ModelAndView("adminProgram/stepEditNotice");
        modelAndView.addObject("notice", notice);
        return modelAndView;
    }

    @PostMapping("/edit")
    public String editNotice(@ModelAttribute Notice notice) {
        Notice existingNotice = noticeService.getNoticeById(notice.getIdNotice());
        notice.setCreatedDate(existingNotice.getCreatedDate());  // 기존 작성 날짜 유지
        notice.setViews(existingNotice.getViews());  // 기존 조회수 유지
        noticeService.updateNotice(notice.getIdNotice(), notice);
        return "redirect:/notice/noticeList";
    }

    // 삭제
    @GetMapping("/delete/{idNotice}")
    public String deleteNotice(@PathVariable int idNotice, HttpSession session) {
        noticeService.deleteNotice(idNotice);
        return "redirect:/notice/noticeList";
    }

    // 공지사항 상세 조회 기능 추가
    @GetMapping("/view/{idNotice}")
    public ModelAndView viewNotice(@PathVariable int idNotice) {
        noticeService.incrementViews(idNotice); // 조회수 증가
        Notice notice = noticeService.getNoticeById(idNotice);
        ModelAndView modelAndView = new ModelAndView("adminProgram/viewNotice");
        modelAndView.addObject("notice", notice);
        return modelAndView;
    }

    // 공지사항 검색 기능 추가
    @GetMapping("/search")
    public ModelAndView searchNotices(@RequestParam("keyword") String keyword, @RequestParam(value = "page", defaultValue = "1") int pageNum) {
        List<Notice> notices = noticeService.getNoticesByPageWithKeyword(pageNum, keyword);
        int totalPages = (int) Math.ceil((double) noticeService.getTotalNoticesByKeyword(keyword) / 10);

        ModelAndView modelAndView = new ModelAndView("adminProgram/noticeList");
        modelAndView.addObject("notices", notices);
        modelAndView.addObject("totalPages", totalPages);
        modelAndView.addObject("currentPage", pageNum);
        modelAndView.addObject("keyword", keyword);

        return modelAndView;
    }

    // 페이지네이션 기능
    @GetMapping("/page/{pageNum}")
    public ModelAndView paginateNotices(@PathVariable int pageNum, @RequestParam(value = "keyword", required = false) String keyword, RedirectAttributes redirectAttributes) {
        int totalNotices;
        int totalPages;
        List<Notice> notices;

        if (keyword != null && !keyword.isEmpty()) {
            totalNotices = noticeService.getTotalNoticesByKeyword(keyword);
            totalPages = (int) Math.ceil(totalNotices / 10.0);
            notices = noticeService.getNoticesByPageWithKeyword(pageNum, keyword);
        } else {
            totalNotices = noticeService.getTotalNotices();
            totalPages = (int) Math.ceil(totalNotices / 10.0);
            notices = noticeService.getNoticesByPage(pageNum);
        }

        if (pageNum < 1 || pageNum > totalPages) {
            redirectAttributes.addFlashAttribute("errorMessage", "잘못된 페이지 번호입니다.");
            return new ModelAndView("redirect:/notice/page/1");
        }

        ModelAndView modelAndView = new ModelAndView("adminProgram/noticeList");
        modelAndView.addObject("notices", notices);
        modelAndView.addObject("totalPages", totalPages);
        modelAndView.addObject("currentPage", pageNum);
        modelAndView.addObject("keyword", keyword);
        return modelAndView;
    }

    // 최신공지사항을 메인화면으로
    @GetMapping("/latest")
    @ResponseBody
    public List<Notice> getLatestNotices() {
        return noticeService.getLatestNotices();
    }
}
