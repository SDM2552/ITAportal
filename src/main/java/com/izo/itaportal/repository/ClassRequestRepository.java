package com.izo.itaportal.repository;

/**
 * 휴보강신청 CRUD
 * @author 김봄이
 */

import com.izo.itaportal.model.ClassRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClassRequestRepository {
    //휴보강신청 등록
    public void insertClassRequest(ClassRequest classRequest);

    //휴보강신청 내역 조회(강사)
    public List<ClassRequest> selectClassRequest(int idPgm);

    //휴보강신청 내역 조회(관리자)
    public List<ClassRequest> selectAllClassRequest();

    //휴보강신청 수정
    public void updateClassRequest(ClassRequest classRequest);

    //승인
    public void updateApprove(int idClassRequest);

    //반려
    public void updateReject(int idClassRequest);
}
