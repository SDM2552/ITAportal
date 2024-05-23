package com.izo.itaportal.service;

import com.izo.itaportal.model.Messenger;
import com.izo.itaportal.repository.MessengerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessengerService {

    @Autowired
    private MessengerRepository messengerRepository;

    // 쪽지를 전송합니다.
    public void sendMessenger(Messenger messenger) {
        messengerRepository.sendMessenger(messenger);
    }

    // 여러 쪽지를 일괄 전송합니다.
    public void sendBulkMessengers(List<Messenger> messengers) {
        messengerRepository.sendBulkMessengers(messengers);
    }

    // 특정 수신자가 받은 쪽지 목록을 조회합니다.
    public List<Messenger> getReceivedMessengers(String receiverLoginId) {
        return messengerRepository.getReceivedMessengers(receiverLoginId);
    }

    // 특정 발신자가 보낸 쪽지 목록을 조회합니다.
    public List<Messenger> getSentMessengers(String senderLoginId) {
        return messengerRepository.getSentMessengers(senderLoginId);
    }

    // 쪽지를 저장합니다.
    public void saveMessenger(Messenger messenger) {
        messengerRepository.saveMessenger(messenger);
    }

    // 쪽지를 읽음으로 표시합니다.
    public void markMessengerAsRead(int idMessenger) {
        messengerRepository.markMessengerAsRead(idMessenger);
    }

    // 쪽지의 내용을 업데이트합니다.
    public void updateMessenger(Messenger messenger) {
        messengerRepository.updateMessenger(messenger);
    }

    // 쪽지를 삭제합니다.
    public void deleteMessenger(int idMessenger) {
        messengerRepository.deleteMessenger(idMessenger);
    }

    // 여러 쪽지를 일괄 삭제합니다.
    public void deleteBulkMessengers(List<Integer> idMessengers) {
        messengerRepository.deleteBulkMessengers(idMessengers);
    }
}
