package com.izo.itaportal.service;

import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.dto.SugangDto;
import com.izo.itaportal.repository.SugangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SugangService {

    @Autowired
    SugangRepository sugangRepository;

    //수강 목록 출력
    public List<ProgramAllDto> getAllProgram(){
        return sugangRepository.findAll();
    }

    //프로그램 상세정보
    public ProgramAllDto getProgramDetail(int programId) {
        return sugangRepository.findById(programId);
    }
    //수강 신청
    public void applyEnrollmentRequest(int commonId, int idPgm, int idCate){
       sugangRepository.saveSugang(commonId, idPgm, idCate);
    }
    //수강 취소
    public boolean cancelSugang(int idPgm, int idStudent) {
        int rowsUpdated = sugangRepository.updateSugangStatus(idPgm, idStudent);
        return rowsUpdated > 0;
    }
    public List<SugangDto>getAllSugang(){
        return sugangRepository.findAllSugang();
    }

    //수강 승인
    public boolean sugangOk(int idPgm, int idStudent) {
        int rowsUpdated = sugangRepository.updateToSugangOk(idPgm, idStudent);
        return rowsUpdated > 0;
    }
    //수강 승인될때 출석부 생성
    public void addAttendance(int idPgm, int idStudent){
        sugangRepository.createAttendance(idPgm, idStudent);
    }
    //수강 승인될때 수강생 숫자 +1 증가
    public void addNumOfStu(int idPgm){
        sugangRepository.updateNumOfStu(idPgm);
    }

    //수강 승인 거부
    public boolean sugangNo(int idPgm, int idStudent) {
        int rowsUpdated = sugangRepository.updateToSugangNo(idPgm, idStudent);
        return rowsUpdated > 0;
    }
}
