package com.izo.itaportal.service;

import com.izo.itaportal.dto.MessengerDto;
import com.izo.itaportal.repository.MessengerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class MessengerService {

    @Autowired
    private MessengerRepository messengerRepository;

    // 받은 메신저 목록 조회
    public List<MessengerDto> getReceivedMessengers(String receiverLoginId) {
        return messengerRepository.getReceivedMessengers(receiverLoginId);
    }

    // 보낸 메신저 목록 조회
    public List<MessengerDto> getSentMessengers(String senderLoginId) {
        return messengerRepository.getSentMessengers(senderLoginId);
    }

    // 저장된 메신저 목록 조회
    public List<MessengerDto> getSavedMessengers(String senderLoginId) {
        return messengerRepository.getSavedMessengers(senderLoginId);
    }

    // 메신저 전송
    public void sendMessenger(MessengerDto messenger) {
        messenger.setSentAt(LocalDateTime.now());
        messengerRepository.sendMessenger(messenger);
    }

    // 여러 메신저 일괄 전송
    public void sendBulkMessengers(List<MessengerDto> messengers) {
        messengerRepository.sendBulkMessengers(messengers);
    }

    // 메신저 저장
    public void saveMessenger(MessengerDto messenger) {
        messenger.setDeleted(false);
        messenger.setUpdatedAt(LocalDateTime.now());
        messengerRepository.saveMessenger(messenger);
    }

    // 저장된 메신저 전송
    public void sendFromSaved(int idMessenger) {
        messengerRepository.updateMessengerAsSent(idMessenger);
    }

    // 메신저 읽음으로 표시
    public void markAsRead(int idMessenger, String loginId) {
        MessengerDto messenger = messengerRepository.getMessengerById(idMessenger);
        if (messenger != null) {
            if (loginId.equals(messenger.getReceiverLoginId())) {
                messengerRepository.markReceiverAsRead(idMessenger);
            } else if (loginId.equals(messenger.getSenderLoginId())) {
                messengerRepository.markSenderAsRead(idMessenger);
            }
        }
    }

    // 메신저 업데이트
    public void updateMessenger(MessengerDto messenger) {
        messengerRepository.updateMessenger(messenger);
    }

    // 메신저 삭제
    public void deleteMessenger(int idMessenger) {
        messengerRepository.deleteMessenger(idMessenger);
    }

    // 여러 메신저 일괄 삭제
    public void deleteBulkMessengers(List<Integer> idMessengers) {
        messengerRepository.deleteBulkMessengers(idMessengers);
    }

    // 특정 메신저 조회
    public MessengerDto getMessengerById(int idMessenger) {
        return messengerRepository.getMessengerById(idMessenger);
    }
}
