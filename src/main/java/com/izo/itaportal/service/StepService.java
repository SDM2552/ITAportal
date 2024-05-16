//package com.izo.itaportal.service;
//
//import com.izo.itaportal.model.Notice;
//import com.izo.itaportal.model.User;
//import com.izo.itaportal.repository.StepRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//@Service
//public class StepService {
//
//    @Autowired
//    private StepRepository stepRepository;
//
//    public void registerStaff(User user) {
//        stepRepository.insertStaff(user);
//    }
//
//    public boolean authenticate(User user) {
//        User foundUser = stepRepository.findUserByLoginIdAndPassword(user.getLoginId(), user.getPassword());
//        return foundUser != null && "admin".equals(foundUser.getRole());
//    }
//
//    public void createNotice(Notice notice) {
//        stepRepository.insertNotice(notice);
//    }
//
//    public void updateNotice(int noticeId, Notice notice) {
//        stepRepository.updateNotice(noticeId, notice.getTitle(), notice.getContent());
//    }
//
//    public Notice findNoticeById(int noticeId) {
//        return stepRepository.findNoticeById(noticeId);
//    }
//
//    public void deleteNotice(int noticeId) {
//        stepRepository.deleteNotice(noticeId);
//    }
//}