package com.izo.itaportal.service;

import com.izo.itaportal.model.ProgramView;
import com.izo.itaportal.model.Syllabus;
import com.izo.itaportal.model.SyllabusRequest;
import com.izo.itaportal.repository.SyllabusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 강의계획서 CRUD
 * PK와 FK를 제외한 나머지는 Nullable 조건으로, 주차별 강의계획에서 기술 가능하도록함
 *     (매주 달라질 수 있으므로)
 * @author 김봄이
 */
@Service
public class SyllabusService {

    @Autowired
    SyllabusRepository syllabusRepository;

    //강의계획서 CRUD를 위한 수업정보 불러오기
    public ProgramView selectJoinPgmByidPgm(int idPgm){
        return syllabusRepository.selectJoinPgmByidPgm(idPgm);
    }

    //강의계획서 불러오기
    public Syllabus selectSyllabus(SyllabusRequest syllabusRequest){
        return syllabusRepository.selectSyllabus(syllabusRequest);
    }

    //강의계획서 입력
    public void insertSyllabus(Syllabus syllabus){
        syllabusRepository.insertSyllabus(syllabus);
    }

    //강의계획서 수정
    public void updateSyllabus(Syllabus syllabus){
        syllabusRepository.updateSyllabus(syllabus);
    }

}
