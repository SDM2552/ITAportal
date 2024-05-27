package com.izo.itaportal.repository;

import com.izo.itaportal.model.Schedule;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 주차별 강의계획 CRUD
 * @author 김봄이
 * 
 */
@Mapper
public interface ScheduleRepository {
    //주차별 강의계획 입력
    public void insertSchedule(Schedule schedule);
    //주차별 강의계획 조회
    public List<Schedule> selectAllSchedule(int idPgm);
    //최대 idSched
    public int selectMaxIdSchedByIdPgm(int idPgm);
    //입력 및 수정
    public void upsertSchedule(Schedule schedule);
    //주차별 강의계획 단건 조회(By idSched)
    public String selectScheduleByIdSched(int idPgm, int idSched);
}
