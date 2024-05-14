package com.izo.itaportal.service;

import com.izo.itaportal.model.Syllabus;
import com.izo.itaportal.repository.SyllabusMapper;
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
    SyllabusMapper syllabusMapper;

    //강의계획서 입력
    public void insertSyllabus(Syllabus syllabus){
        syllabusMapper.insertSyllabus(syllabus);
    }

    //강의계획서 수정
    public void updateSyllabus(Syllabus syllabus){
        syllabusMapper.updateSyllabus(syllabus);
    }

}
