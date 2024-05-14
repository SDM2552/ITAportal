package com.izo.itaportal.service;

import com.izo.itaportal.entity.User;
import com.izo.itaportal.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class UserService {

//    @Autowired
//    private UserRepository userRepository;
//
//    public User registerNewUser(com.izo.itaportal.model.User userModel) {
//        User user = new User();
//        user.setLoginId(userModel.getLoginId());
//        user.setPassword(userModel.getPassword());
//        user.setRole(userModel.getRole());
//        user.setRegistDate(LocalDateTime.now().toString());
//
//        return userRepository.save(user);
//    }
//
//    public Optional<User> findById(int id) {
//        return userRepository.findById(id);
//    }
//
//    public User updateUser(User user) {
//        return userRepository.save(user);
//    }
}
