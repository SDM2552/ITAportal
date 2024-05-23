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
//public class KakaoTalkService {
//
//    // 카카오 API 키
//    @Value("${kakao.api.key}")
//    private String apiKey;
//
//    // 카카오톡 메시지 전송 메서드
//    public void sendKakaoTalkMessage(String kakaoId, String messageBody) {
//        RestTemplate restTemplate = new RestTemplate();
//        String url = "https://kapi.kakao.com/v2/api/talk/memo/default/send";
//
//        HttpHeaders headers = new HttpHeaders();
//        headers.set("Authorization", "Bearer " + getAccessToken(kakaoId));
//
//        String payload = "{\"object_type\":\"text\",\"text\":\"" + messageBody + "\",\"link\":{\"web_url\":\"https://developers.kakao.com\"}}";
//
//        HttpEntity<String> request = new HttpEntity<>(payload, headers);
//        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, request, String.class);
//
//        System.out.println(response.getBody());
//    }
//
//    // 카카오톡 액세스 토큰 획득 메서드
//    private String getAccessToken(String kakaoId) {
//        // 여기서 카카오톡 사용자 인증 및 액세스 토큰 획득 로직을 구현해야 합니다.
//        // 이 예제에서는 단순히 액세스 토큰을 반환하는 것으로 간주합니다.
//        return "YOUR_ACCESS_TOKEN";
//    }
//}
