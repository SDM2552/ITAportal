package com.izo.itaportal.controller;

import com.izo.itaportal.model.LoginResponse;
import com.izo.itaportal.model.Messenger;
import com.izo.itaportal.service.MessengerService;
import com.izo.itaportal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/messenger")
public class MessengerController {

    @Autowired
    private MessengerService messengerService;

    @Autowired
    private UserService userService;

    // 쪽지 리스트 페이지를 반환합니다.
    @GetMapping("/list")
    public String messengerList() {
        return "messenger/messengerList";
    }

    // 특정 수신자가 받은 쪽지 목록을 반환합니다.
    @GetMapping("/received")
    @ResponseBody
    public List<Messenger> getReceivedMessengers(HttpSession session) {
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        return user != null ? messengerService.getReceivedMessengers(user.getLoginId()) : null;
    }

    // 특정 발신자가 보낸 쪽지 목록을 반환합니다.
    @GetMapping("/sent")
    @ResponseBody
    public List<Messenger> getSentMessengers(HttpSession session) {
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        return user != null ? messengerService.getSentMessengers(user.getLoginId()) : null;
    }

    // 쪽지 작성 페이지를 반환합니다.
    @GetMapping("/create")
    public String createMessenger() {
        return "messenger/createMessenger";
    }

    // 쪽지를 전송합니다.
    @PostMapping("/send")
    public String sendMessenger(HttpSession session, @RequestParam("receiverLoginId") String receiverLoginId, @RequestParam("subject") String subject, @RequestParam("messageText") String messageText) {
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        if (user == null) {
            return "redirect:/user/login";
        }
        Messenger messenger = new Messenger();
        messenger.setSenderLoginId(user.getLoginId());
        messenger.setReceiverLoginId(receiverLoginId);
        messenger.setSenderRole(user.getRole());
        messenger.setReceiverRole(userService.getRoleByLoginId(receiverLoginId));
        messenger.setSubject(subject);
        messenger.setMessageText(messageText);
        messengerService.sendMessenger(messenger);
        return "redirect:/messenger/list";
    }

    // 여러 쪽지를 일괄 전송합니다.
    @PostMapping("/sendBulk")
    @ResponseBody
    public void sendBulkMessengers(HttpSession session, @RequestParam("receiverLoginIds") List<String> receiverLoginIds, @RequestParam("subject") String subject, @RequestParam("messageText") String messageText) {
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        if (user != null) {
            List<Messenger> messengers = new ArrayList<>();
            for (String receiverLoginId : receiverLoginIds) {
                Messenger messenger = new Messenger();
                messenger.setSenderLoginId(user.getLoginId());
                messenger.setReceiverLoginId(receiverLoginId);
                messenger.setSenderRole(user.getRole());
                messenger.setReceiverRole(userService.getRoleByLoginId(receiverLoginId));
                messenger.setSubject(subject);
                messenger.setMessageText(messageText);
                messengers.add(messenger);
            }
            messengerService.sendBulkMessengers(messengers);
        }
    }

    // 쪽지를 저장합니다.
    @PostMapping("/save")
    @ResponseBody
    public void saveMessenger(HttpSession session, @RequestParam("receiverLoginId") String receiverLoginId, @RequestParam("subject") String subject, @RequestParam("messageText") String messageText) {
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        if (user == null) {
            return;
        }
        Messenger messenger = new Messenger();
        messenger.setSenderLoginId(user.getLoginId());
        messenger.setReceiverLoginId(receiverLoginId);
        messenger.setSenderRole(user.getRole());
        messenger.setReceiverRole(userService.getRoleByLoginId(receiverLoginId));
        messenger.setSubject(subject);
        messenger.setMessageText(messageText);
        messengerService.saveMessenger(messenger);
    }

    // 쪽지를 읽음으로 표시합니다.
    @PostMapping("/markAsRead")
    @ResponseBody
    public void markAsRead(@RequestParam("idMessenger") int idMessenger) {
        messengerService.markMessengerAsRead(idMessenger);
    }

    // 쪽지의 내용을 업데이트합니다.
    @PostMapping("/update")
    @ResponseBody
    public void updateMessenger(@RequestParam("idMessenger") int idMessenger, @RequestParam("messageText") String messageText) {
        Messenger messenger = new Messenger();
        messenger.setIdMessenger(idMessenger);
        messenger.setMessageText(messageText);
        messengerService.updateMessenger(messenger);
    }

    // 쪽지를 삭제합니다.
    @PostMapping("/delete")
    @ResponseBody
    public void deleteMessenger(@RequestParam("idMessenger") int idMessenger) {
        messengerService.deleteMessenger(idMessenger);
    }

    // 여러 쪽지를 일괄 삭제합니다.
    @PostMapping("/deleteBulk")
    @ResponseBody
    public void deleteBulkMessengers(@RequestParam("idMessengers") List<Integer> idMessengers) {
        messengerService.deleteBulkMessengers(idMessengers);
    }
}
