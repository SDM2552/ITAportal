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

    public List<MessengerDto> getReceivedMessengers(String receiverLoginId) {
        return messengerRepository.getReceivedMessengers(receiverLoginId);
    }

    public List<MessengerDto> getSentMessengers(String senderLoginId) {
        return messengerRepository.getSentMessengers(senderLoginId);
    }

    public void sendMessenger(MessengerDto messenger) {
        messenger.setSentAt(LocalDateTime.now());
        messengerRepository.sendMessenger(messenger);
    }

    public void sendBulkMessengers(List<MessengerDto> messengers) {
        messengerRepository.sendBulkMessengers(messengers);
    }

    public void saveMessenger(MessengerDto messenger) {
        messenger.setSentAt(LocalDateTime.now());
        messenger.setDeleted(true);
        messengerRepository.saveMessenger(messenger);
    }

    public void markMessengerAsRead(int idMessenger) {
        messengerRepository.markMessengerAsRead(idMessenger);
    }

    public void updateMessenger(MessengerDto messenger) {
        messengerRepository.updateMessenger(messenger);
    }

    public void deleteMessenger(int idMessenger) {
        messengerRepository.deleteMessenger(idMessenger);
    }

    public void deleteBulkMessengers(List<Integer> idMessengers) {
        messengerRepository.deleteBulkMessengers(idMessengers);
    }
}
