package com.izo.itaportal.service;

import com.izo.itaportal.dto.RegistrationRequest;
import com.izo.itaportal.model.Admin;
import com.izo.itaportal.model.User;
import com.izo.itaportal.repository.AdminRepository;
import com.izo.itaportal.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RegistrationService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private AdminRepository adminRepository;

    @Transactional
    public void registerUserAndAdmin(RegistrationRequest request){

        User user = new User();
        user.setLoginId(request.getLoginId());
        user.setPassword(request.getPassword());
        user.setRole(request.getRole());
        user.setRegistDate(request.getRegistDate());

        userRepository.insertUser(user);
        int idUser = user.getIdUser();

        Admin admin = new Admin();
        admin.setName(request.getName());
        admin.setBirth(request.getBirth());
        admin.setTel(request.getTel());
        admin.setAddress(request.getAddress());
        admin.setGender(request.getGender());
        admin.setIdUser(idUser);

        adminRepository.insertAdmin(admin);
    }
}
