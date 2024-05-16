package com.izo.itaportal.mapper;

/**
 * 강의계획서 CRUD
 * PK와 FK를 제외한 나머지는 Nullable 조건으로, 주차별 강의계획에서 기술 가능하도록함
 *     (매주 달라질 수 있으므로)
 * @author 김봄이
 */

import com.izo.itaportal.model.ProgramView;
import com.izo.itaportal.model.Syllabus;
import com.izo.itaportal.model.SyllabusRequest;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SyllabusMapper {
    //강의계획서 불러오기(교수id, 프로그램id)
    public Syllabus selectSyllabus(SyllabusRequest syllabusRequest);
    //강의계획서 입력
    public void insertSyllabus(Syllabus syllabus);
    //강의계획서 수정
    public void updateSyllabus(Syllabus syllabus);
    //프로그램 정보(카테고리 + 강의실)
    public ProgramView selectJoinPgmByidPgm(int idPgm);

}
