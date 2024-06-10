//package com.izo.itaportal.service;
//
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.http.HttpEntity;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpMethod;
//import org.springframework.http.MediaType;
//import org.springframework.stereotype.Service;
//import org.springframework.web.client.RestTemplate;
//
//import java.util.Collections;
//import java.util.HashMap;
//import java.util.Map;
//
//@Service
//public class KakaoService {
//
//    @Value("${kakao.api.url}")
//    private String kakaoApiUrl;
//
//    @Value("${kakao.api.key}")
//    private String kakaoApiKey; // 액세스 토큰
//
//    private final RestTemplate restTemplate;
//
//    public KakaoService(RestTemplate restTemplate) {
//        this.restTemplate = restTemplate;
//    }
//
//    public void sendKakaoMessage(String kakaoId, String message) {
//        String url = kakaoApiUrl + "/v2/api/talk/memo/default/send";
//        HttpHeaders headers = new HttpHeaders();
//        headers.set("Authorization", "Bearer " + kakaoApiKey);
//        headers.setContentType(MediaType.APPLICATION_JSON);
//
//        Map<String, Object> payload = new HashMap<>();
//        payload.put("template_object", buildTemplateObject(message));
//        HttpEntity<Map<String, Object>> request = new HttpEntity<>(payload, headers);
//
//        restTemplate.exchange(url, HttpMethod.POST, request, String.class);
//    }
//
//    private Map<String, Object> buildTemplateObject(String message) {
//        Map<String, Object> templateObject = new HashMap<>();
//        templateObject.put("object_type", "text");
//        templateObject.put("text", message);
//        templateObject.put("link", Collections.singletonMap("web_url", "http://yourwebsite.com"));
//        return templateObject;
//    }
//}
