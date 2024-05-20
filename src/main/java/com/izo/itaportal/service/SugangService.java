package com.izo.itaportal.service;

import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.model.Sugang;
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

}
