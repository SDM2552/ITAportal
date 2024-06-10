package com.izo.itaportal.controller;

import com.izo.itaportal.dto.MessengerDto;
import com.izo.itaportal.model.LoginResponse;
import com.izo.itaportal.service.MessengerService;
import com.izo.itaportal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @GetMapping("/saved")
    @ResponseBody
    public List<MessengerDto> getSavedMessengers(HttpSession session) {
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        return user != null ? messengerService.getSavedMessengers(user.getLoginId()) : null;
    }

    @GetMapping("/create")
    public String createMessenger() {
        return "messenger/createMessenger";
    }

    @PostMapping("/send")
    public ResponseEntity<String> sendMessenger(HttpSession session, @RequestParam("receiverLoginId") String receiverLoginId, @RequestParam("subject") String subject, @RequestParam("messageText") String messageText) {
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        if (user == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
        }
        MessengerDto messenger = new MessengerDto();
        messenger.setSenderLoginId(user.getLoginId());
        messenger.setReceiverLoginId(receiverLoginId);
        messenger.setSenderRole(user.getRole());
        messenger.setReceiverRole(userService.getRoleByLoginId(receiverLoginId));
        messenger.setSubject(subject);
        messenger.setMessageText(messageText);
        messengerService.sendMessenger(messenger);
        return ResponseEntity.ok("쪽지가 전송되었습니다.");
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
    public ResponseEntity<String> saveMessenger(HttpSession session, @RequestParam("receiverLoginId") String receiverLoginId, @RequestParam("subject") String subject, @RequestParam("messageText") String messageText) {
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        if (user == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
        }
        MessengerDto messenger = new MessengerDto();
        messenger.setSenderLoginId(user.getLoginId());
        messenger.setReceiverLoginId(receiverLoginId);
        messenger.setSenderRole(user.getRole());
        messenger.setReceiverRole(userService.getRoleByLoginId(receiverLoginId));
        messenger.setSubject(subject);
        messenger.setMessageText(messageText);
        messengerService.saveMessenger(messenger);
        return ResponseEntity.ok("쪽지가 저장되었습니다.");
    }

    @PostMapping("/markAsRead")
    @ResponseBody
    public void markAsRead(HttpSession session, @RequestParam("idMessenger") int idMessenger) {
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        if (user != null) {
            messengerService.markMessengerAsRead(idMessenger, user.getLoginId());
        }
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

    @PostMapping("/sendFromSaved")
    @ResponseBody
    public ResponseEntity<String> sendFromSaved(HttpSession session, @RequestParam("idMessenger") int idMessenger) {
        // 로그인 사용자 확인
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        if (user == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
        }

        // 임시저장된 메시지 전송
        messengerService.sendSavedMessenger(idMessenger);
        return ResponseEntity.ok("메시지가 전송되었습니다.");
    }

    @GetMapping("/view")
    public String viewMessenger(@RequestParam("idMessenger") Integer idMessenger, HttpSession session, Model model) {
        if (idMessenger == null) {
            return "redirect:/messenger/list"; // idMessenger 파라미터가 없을 때 리스트 페이지로 리다이렉트
        }
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");
        MessengerDto messenger = messengerService.getMessengerById(idMessenger);
        if (user != null) {
            messengerService.markMessengerAsRead(idMessenger, user.getLoginId()); // 메시지 읽음으로 표시
        }
        model.addAttribute("messenger", messenger);
        return "messenger/messengerView";
    }

    @GetMapping("/reply")
    public String replyMessenger(@RequestParam("idMessenger") Integer idMessenger, Model model) {
        MessengerDto originalMessenger = messengerService.getMessengerById(idMessenger);
        if (originalMessenger == null) {
            return "redirect:/messenger/list"; // 원본 메시지가 없으면 리스트 페이지로 리다이렉트
        }

        MessengerDto replyMessenger = new MessengerDto();
        replyMessenger.setReceiverLoginId(originalMessenger.getSenderLoginId());
        replyMessenger.setReceiverRole(originalMessenger.getSenderRole());
        replyMessenger.setSubject("RE: " + originalMessenger.getSubject());

        model.addAttribute("originalMessenger", originalMessenger);
        model.addAttribute("replyMessenger", replyMessenger);

        return "messenger/replyMessenger";
    }
}
