//package com.izo.itaportal.controller;
//
//import com.izo.itaportal.service.KakaoService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.Map;
//
//@Controller
//@RequestMapping("/kakao")
//public class KakaoController {
//
//    @Autowired
//    private KakaoService kakaoService;
//
//    @GetMapping("/form")
//    public String showKakaoForm() {
//        return "kakao/kakaoForm";
//    }
//
//    @PostMapping("/send")
//    public ResponseEntity<String> sendKakaoTalk(@RequestBody Map<String, String> payload) {
//        String kakaoId = payload.get("kakaoId");
//        String message = payload.get("message");
//        kakaoService.sendKakaoMessage(kakaoId, message);
//        return ResponseEntity.ok("KakaoTalk message sent successfully");
//    }
//}
