//package com.izo.itaportal.controller;
//
//import com.izo.itaportal.service.KakaoTalkService;
//import com.izo.itaportal.service.SMSService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.*;
//
//@Controller
//@RequestMapping("/messages")
//public class SocialController {
//
//    @Autowired
//    private SMSService smsService;
//
//    @Autowired
//    private KakaoTalkService kakaoTalkService;
//
//    // SMS 전송 API 엔드포인트
//    @PostMapping("/sendSMS")
//    public ResponseEntity<String> sendSMS(@RequestParam String toPhoneNumber, @RequestParam String message) {
//        smsService.sendSMS(toPhoneNumber, message);
//        return ResponseEntity.ok("SMS sent successfully");
//    }
//
//    // 카카오톡 메시지 전송 API 엔드포인트
//    @PostMapping("/sendKakaoTalk")
//    public ResponseEntity<String> sendKakaoTalk(@RequestParam String kakaoId, @RequestParam String message) {
//        kakaoTalkService.sendKakaoTalkMessage(kakaoId, message);
//        return ResponseEntity.ok("KakaoTalk message sent successfully");
//    }
//}
