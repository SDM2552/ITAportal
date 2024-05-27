package com.izo.itaportal.service;

import com.izo.itaportal.dto.MessengerDto;
import com.izo.itaportal.repository.MessengerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessengerService {

    @Autowired
    private MessengerRepository messengerRepository;

    // 특정 수신자가 받은 메신저 목록을 조회합니다.
    public List<MessengerDto> getReceivedMessengers(String receiverLoginId) {
        return messengerRepository.getReceivedMessengers(receiverLoginId);
    }

    // 특정 발신자가 보낸 메신저 목록을 조회합니다.
    public List<MessengerDto> getSentMessengers(String senderLoginId) {
        return messengerRepository.getSentMessengers(senderLoginId);
    }

    // 메신저를 전송합니다.
    public void sendMessenger(MessengerDto messenger) {
        messengerRepository.sendMessenger(messenger);
    }

    // 여러 메신저를 일괄 전송합니다.
    public void sendBulkMessengers(List<MessengerDto> messengers) {
        messengerRepository.sendBulkMessengers(messengers);
    }

    // 메신저를 저장합니다.
    public void saveMessenger(MessengerDto messenger) {
        messengerRepository.saveMessenger(messenger);
    }

    // 메신저를 읽음으로 표시합니다.
    public void markMessengerAsRead(int idMessenger) {
        messengerRepository.markMessengerAsRead(idMessenger);
    }

    // 메신저의 내용을 업데이트합니다.
    public void updateMessenger(MessengerDto messenger) {
        messengerRepository.updateMessenger(messenger);
    }

    // 메신저를 삭제합니다.
    public void deleteMessenger(int idMessenger) {
        messengerRepository.deleteMessenger(idMessenger);
    }

    // 여러 메신저를 일괄 삭제합니다.
    public void deleteBulkMessengers(List<Integer> idMessengers) {
        messengerRepository.deleteBulkMessengers(idMessengers);
    }
}
