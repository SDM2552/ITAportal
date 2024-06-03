package com.izo.itaportal.repository;

import com.izo.itaportal.dto.MessengerDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MessengerRepository {

    // 메신저를 전송합니다.
    void sendMessenger(MessengerDto messenger);

    // 여러 메신저를 일괄 전송합니다.
    void sendBulkMessengers(List<MessengerDto> messengers);

    // 특정 수신자가 받은 메신저 목록을 조회합니다.
    List<MessengerDto> getReceivedMessengers(@Param("receiverLoginId") String receiverLoginId);

    // 특정 발신자가 보낸 메신저 목록을 조회합니다.
    List<MessengerDto> getSentMessengers(@Param("senderLoginId") String senderLoginId);

    // 저장된 메신저 목록을 조회합니다.
    List<MessengerDto> getSavedMessengers(@Param("senderLoginId") String senderLoginId);

    // 메신저를 저장합니다.
    void saveMessenger(MessengerDto messenger);

    // 수신자가 메신저를 읽음으로 표시합니다.
    void markReceiverAsRead(@Param("idMessenger") int idMessenger);

    // 발신자가 메신저를 읽음으로 표시합니다.
    void markMessengerAsRead(@Param("idMessenger") int idMessenger);

    // 메신저의 내용을 업데이트합니다.
    void updateMessenger(MessengerDto messenger);

    // 메신저를 삭제합니다.
    void deleteMessenger(int idMessenger);

    // 여러 메신저를 일괄 삭제합니다.
    void deleteBulkMessengers(List<Integer> idMessengers);

    // 특정 메신저를 조회합니다.
    MessengerDto getMessengerById(int idMessenger);

    // 임시저장된 메신저를 전송 상태로 업데이트합니다.
    void updateMessengerAsSent(@Param("idMessenger") int idMessenger);
}
