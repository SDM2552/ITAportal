package com.izo.itaportal.controller;

import com.izo.itaportal.service.KakaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/kakao")
public class KakaoController {

    @Autowired
    private KakaoService kakaoService;

    @GetMapping("/form")
    public String showKakaoForm() {
        return "kakao/kakaoForm";
    }

    @PostMapping("/send")
    public ResponseEntity<String> sendKakaoTalk(@RequestParam String kakaoId, @RequestParam String message) {
        kakaoService.sendKakaoMessage(kakaoId, message);
        return ResponseEntity.ok("KakaoTalk message sent successfully");
    }
}
