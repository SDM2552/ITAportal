//package com.izo.itaportal.service;
//
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.http.HttpEntity;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpMethod;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Service;
//import org.springframework.web.client.RestTemplate;
//
//@Service
//public class KakaoService {
//
//    @Value("${kakao.api.url}")
//    private String apiUrl;
//
//    @Value("${kakao.api.key}")
//    private String apiKey;
//
//    public void sendKakaoMessage(String kakaoId, String message) {
//        RestTemplate restTemplate = new RestTemplate();
//        HttpHeaders headers = new HttpHeaders();
//        headers.set("Authorization", "Bearer " + apiKey);
//
//        HttpEntity<String> entity = new HttpEntity<>(message, headers);
//
//        ResponseEntity<String> response = restTemplate.exchange(
//                apiUrl + "/v1/api/talk/friends/message/default/send",
//                HttpMethod.POST,
//                entity,
//                String.class
//        );
//
//        if (!response.getStatusCode().is2xxSuccessful()) {
//            throw new RuntimeException("Failed to send KakaoTalk message");
//        }
//    }
//}
