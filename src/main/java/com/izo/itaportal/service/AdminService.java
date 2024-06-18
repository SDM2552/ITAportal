package com.izo.itaportal.service;

import com.izo.itaportal.model.Admin;
import com.izo.itaportal.model.ClassRequest;
import com.izo.itaportal.repository.AdminRepository;
import com.izo.itaportal.repository.ClassRequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class AdminService {

    @Autowired
    AdminRepository adminRepository;
    @Autowired
    ClassRequestRepository classRequestRepository;

    public List<Admin> getAllAdmin(){
        return adminRepository.findAll();
    }

    //휴보강신청 현황 조회
    public List<ClassRequest> selectAllClassRequest(){
        return classRequestRepository.selectAllClassRequest();
    }
    //휴보강신청 승인
    public void updateApprove(int idClassRequest){
        classRequestRepository.updateApprove(idClassRequest);
    }
    //휴보강신청 반려
    public void updateReject(int idClassRequest){
        classRequestRepository.updateReject(idClassRequest);
    }
}