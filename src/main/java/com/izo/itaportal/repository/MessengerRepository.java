package com.izo.itaportal.repository;

import com.izo.itaportal.model.Messenger;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MessengerRepository {

    // 쪽지를 전송합니다.
    void sendMessenger(Messenger messenger);

    // 특정 수신자가 받은 쪽지 목록을 조회합니다.
    List<Messenger> getReceivedMessengers(String receiverLoginId);

    // 특정 발신자가 보낸 쪽지 목록을 조회합니다.
    List<Messenger> getSentMessengers(String senderLoginId);

    // 쪽지를 저장합니다.
    void saveMessenger(Messenger messenger);

    // 쪽지를 읽음으로 표시합니다.
    void markMessengerAsRead(int idMessenger);

    // 쪽지의 내용을 업데이트합니다.
    void updateMessenger(Messenger messenger);

    // 쪽지를 삭제합니다.
    void deleteMessenger(int idMessenger);

    // 여러 쪽지를 일괄 삭제합니다.
    void deleteBulkMessengers(List<Integer> idMessengers);

    // 여러 쪽지를 일괄 전송합니다.
    void sendBulkMessengers(List<Messenger> messengers);
}
