package com.izo.itaportal.service;

import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.dto.SugangDto;
import com.izo.itaportal.repository.SugangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

@Service
public class SugangService {

    @Autowired
    SugangRepository sugangRepository;

    //수강 목록 출력
    public List<ProgramAllDto> getAllProgram() {
        List<ProgramAllDto> programs = sugangRepository.findAll();
        programs.forEach(this::checkSugangClosed);
        return programs;
    }
private void checkSugangClosed(ProgramAllDto program) {
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDate endDate = LocalDate.parse(program.getSugangEndDt(), formatter);
    boolean isClosed = LocalDate.now().isAfter(endDate);
    program.setSugangClosed(isClosed);
}
    //수강신청 기간 지나면 신청 못하게 막는 기능
    public boolean isSugangClosed(int idProgram) {
        Optional<ProgramAllDto> programOptional = findProgramById(idProgram);
        if (programOptional.isPresent()) {
            ProgramAllDto programAllDto = programOptional.get();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate endDate = LocalDate.parse(programAllDto.getSugangEndDt(), formatter);
            return LocalDate.now().isAfter(endDate);
        }
        return false;
    }
    public Optional<ProgramAllDto> findProgramById(int idProgram) {
        ProgramAllDto program = sugangRepository.findById(idProgram);
        return Optional.ofNullable(program);
    }
    //프로그램 상세정보
    public ProgramAllDto getProgramDetail(int programId) {
        return sugangRepository.findById(programId);
    }
    // 수강 신청 중복 체크
    public boolean isAlreadyEnrolled(int commonId, int idPgm) {
        return sugangRepository.checkEnrollment(commonId, idPgm) > 0;
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
