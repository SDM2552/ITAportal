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

    public List<MessengerDto> getSavedMessengers(String senderLoginId) {
        return messengerRepository.getSavedMessengers(senderLoginId);
    }

    public void sendMessenger(MessengerDto messenger) {
        messenger.setSentAt(LocalDateTime.now());
        messengerRepository.sendMessenger(messenger);
    }

    public void sendBulkMessengers(List<MessengerDto> messengers) {
        for (MessengerDto messenger : messengers) {
            messenger.setSentAt(LocalDateTime.now());
        }
        messengerRepository.sendBulkMessengers(messengers);
    }


    public void saveMessenger(MessengerDto messenger) {
        messenger.setDeleted(false);
        messenger.setUpdatedAt(LocalDateTime.now());
        messengerRepository.saveMessenger(messenger);
    }

    public void sendSavedMessenger(int idMessenger) {
        messengerRepository.updateMessengerAsSent(idMessenger);
    }

    public void markMessengerAsRead(int idMessenger, String loginId) {
        MessengerDto messenger = messengerRepository.getMessengerById(idMessenger);
        if (messenger != null) {
            if (loginId.equals(messenger.getReceiverLoginId())) {
                messengerRepository.markReceiverAsRead(idMessenger);
            } else if (loginId.equals(messenger.getSenderLoginId())) {
                messengerRepository.markMessengerAsRead(idMessenger);
            }
        }
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

    public MessengerDto getMessengerById(int idMessenger) {
        return messengerRepository.getMessengerById(idMessenger);
    }
}
