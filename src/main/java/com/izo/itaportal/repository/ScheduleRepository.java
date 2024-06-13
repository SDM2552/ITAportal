package com.izo.itaportal.repository;

import com.izo.itaportal.model.Schedule;
import org.apache.ibatis.annotations.Mapper;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;

/**
 * 주차별 강의계획 CRUD
 * @author 김봄이
 * 
 */
@Mapper
public interface ScheduleRepository {
    //주차별 강의계획 생성
//    public void saveAll(List<Schedule> schedules);
    public void saveAll(Schedule schedule);
    //주차별 강의계획 조회
    public List<Schedule> selectAllSchedule(int idPgm);
    //최대 idSched
    public int selectMaxIdSchedByIdPgm(int idPgm);
    //입력 및 수정
    public void upsertSchedule(Schedule schedule);
    //주차별 강의계획 단건 조회(By idSched)
    public String selectScheduleBySchedNo(int idPgm, int schedNo);
    //주차별 강의일자 조회 (요일별)
    public List<Schedule> selectByDayOfWeek(String stDtStr, String endDtStr, int dayOfWeekValue);
}
