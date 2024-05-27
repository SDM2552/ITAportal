package com.izo.itaportal.controller;

import com.izo.itaportal.dto.MessengerDto;
import com.izo.itaportal.model.LoginResponse;
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

    @GetMapping("/list")
    public String messengerList() {
        return "messenger/messengerList";
    }

    @GetMapping("/received")
    @ResponseBody
    public List<MessengerDto> getReceivedMessengers(HttpSession session) {
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        return user != null ? messengerService.getReceivedMessengers(user.getLoginId()) : null;
    }

    @GetMapping("/sent")
    @ResponseBody
    public List<MessengerDto> getSentMessengers(HttpSession session) {
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        return user != null ? messengerService.getSentMessengers(user.getLoginId()) : null;
    }

    @GetMapping("/create")
    public String createMessenger() {
        return "messenger/createMessenger";
    }

    @PostMapping("/send")
    public String sendMessenger(HttpSession session, @RequestParam("receiverLoginId") String receiverLoginId, @RequestParam("subject") String subject, @RequestParam("messageText") String messageText) {
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        if (user == null) {
            return "redirect:/user/login";
        }
        MessengerDto messenger = new MessengerDto();
        messenger.setSenderLoginId(user.getLoginId());
        messenger.setReceiverLoginId(receiverLoginId);
        messenger.setSenderRole(user.getRole());
        messenger.setReceiverRole(userService.getRoleByLoginId(receiverLoginId));
        messenger.setSubject(subject);
        messenger.setMessageText(messageText);
        messengerService.sendMessenger(messenger);
        return "redirect:/messenger/list";
    }

    @PostMapping("/sendBulk")
    @ResponseBody
    public void sendBulkMessengers(HttpSession session, @RequestParam("receiverLoginIds") List<String> receiverLoginIds, @RequestParam("subject") String subject, @RequestParam("messageText") String messageText) {
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        if (user != null) {
            List<MessengerDto> messengers = new ArrayList<>();
            for (String receiverLoginId : receiverLoginIds) {
                MessengerDto messenger = new MessengerDto();
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

    @PostMapping("/save")
    @ResponseBody
    public void saveMessenger(HttpSession session, @RequestParam("receiverLoginId") String receiverLoginId, @RequestParam("subject") String subject, @RequestParam("messageText") String messageText) {
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        if (user == null) {
            return;
        }
        MessengerDto messenger = new MessengerDto();
        messenger.setSenderLoginId(user.getLoginId());
        messenger.setReceiverLoginId(receiverLoginId);
        messenger.setSenderRole(user.getRole());
        messenger.setReceiverRole(userService.getRoleByLoginId(receiverLoginId));
        messenger.setSubject(subject);
        messenger.setMessageText(messageText);
        messengerService.saveMessenger(messenger);
    }

    @PostMapping("/markAsRead")
    @ResponseBody
    public void markAsRead(@RequestParam("idMessenger") int idMessenger) {
        messengerService.markMessengerAsRead(idMessenger);
    }

    @PostMapping("/update")
    @ResponseBody
    public void updateMessenger(@RequestParam("idMessenger") int idMessenger, @RequestParam("messageText") String messageText) {
        MessengerDto messenger = new MessengerDto();
        messenger.setIdMessenger(idMessenger);
        messenger.setMessageText(messageText);
        messengerService.updateMessenger(messenger);
    }

    @PostMapping("/delete")
    @ResponseBody
    public void deleteMessenger(@RequestParam("idMessenger") int idMessenger) {
        messengerService.deleteMessenger(idMessenger);
    }

    @PostMapping("/deleteBulk")
    @ResponseBody
    public void deleteBulkMessengers(@RequestParam("idMessengers") List<Integer> idMessengers) {
        messengerService.deleteBulkMessengers(idMessengers);
    }
}
