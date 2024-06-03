package com.izo.itaportal.dto;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class MessengerDto {
    private int idMessenger;
    private String senderLoginId;
    private String receiverLoginId;
    private String senderRole;
    private String receiverRole;
    private String subject;
    private String messageText;
    private LocalDateTime sentAt;
    private LocalDateTime updatedAt;
    private boolean messengerRead;
    private boolean receiverRead;
    private boolean deleted;
}
