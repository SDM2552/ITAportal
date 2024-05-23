package com.izo.itaportal.entity;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
public class Messenger {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idMessenger;
    private String senderLoginId;
    private String receiverLoginId;
    private String senderRole;
    private String receiverRole;
    private String subject;
    private String messageText;
    private LocalDateTime sentAt;
    private LocalDateTime updatedAt;
    private boolean isRead;
    private boolean deleted;


}
