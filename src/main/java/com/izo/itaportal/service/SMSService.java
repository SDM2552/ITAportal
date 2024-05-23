//package com.izo.itaportal.service;
//
//import com.twilio.Twilio;
//import com.twilio.rest.api.v2010.account.Message;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Service;
//
//import javax.annotation.PostConstruct;
//
//@Service
//public class SMSService {
//
//    // Twilio 계정 SID
//    @Value("${twilio.account.sid}")
//    private String accountSid;
//
//    // Twilio 인증 토큰
//    @Value("${twilio.auth.token}")
//    private String authToken;
//
//    // Twilio 전화번호
//    @Value("${twilio.phone.number}")
//    private String fromPhoneNumber;
//
//    // Twilio 초기화
//    @PostConstruct
//    public void init() {
//        Twilio.init(accountSid, authToken);
//    }
//
//    // SMS 전송 메서드
//    public void sendSMS(String toPhoneNumber, String messageBody) {
//        Message message = Message.creator(
//                new com.twilio.type.PhoneNumber(toPhoneNumber),
//                new com.twilio.type.PhoneNumber(fromPhoneNumber),
//                messageBody
//        ).create();
//    }
//}
