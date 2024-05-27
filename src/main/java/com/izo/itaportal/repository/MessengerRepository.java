package com.izo.itaportal.repository;

import com.izo.itaportal.dto.MessengerDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MessengerRepository {

    // 메신저를 전송합니다.
    void sendMessenger(MessengerDto messenger);

    // 여러 메신저를 일괄 전송합니다.
    void sendBulkMessengers(List<MessengerDto> messengers);

    // 특정 수신자가 받은 메신저 목록을 조회합니다.
    List<MessengerDto> getReceivedMessengers(String receiverLoginId);

    // 특정 발신자가 보낸 메신저 목록을 조회합니다.
    List<MessengerDto> getSentMessengers(String senderLoginId);

    // 메신저를 저장합니다.
    void saveMessenger(MessengerDto messenger);

    // 메신저를 읽음으로 표시합니다.
    void markMessengerAsRead(int idMessenger);

    // 메신저의 내용을 업데이트합니다.
    void updateMessenger(MessengerDto messenger);

    // 메신저를 삭제합니다.
    void deleteMessenger(int idMessenger);

    // 여러 메신저를 일괄 삭제합니다.
    void deleteBulkMessengers(List<Integer> idMessengers);
}
