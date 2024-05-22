package com.izo.itaportal.service;

import com.izo.itaportal.model.Schedule;
import com.izo.itaportal.repository.ScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Service
public class ScheduleService {

    @Autowired
    ScheduleRepository scheduleRepository;
    //날짜 형식 지정("YYYY-MM-DD")
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    //프로그램 기간별 주수 계산
    public long calculateWeekBetween(String stDtStr, String endDtStr){
        LocalDate stDt = LocalDate.parse(stDtStr, DATE_FORMATTER);
        LocalDate endDt = LocalDate.parse(endDtStr, DATE_FORMATTER);
        long daysBetween = ChronoUnit.DAYS.between(stDt, endDt);
        long weeksBetween = daysBetween / 7;
        if (daysBetween % 7 != 0){
            weeksBetween++;
        }
        return weeksBetween;
    }

    //주차별 강의계획서 입력
    public void insertSchedule(Schedule schedule){
        scheduleRepository.insertSchedule(schedule);
    }

    //입력 및 수정
    public void upsertSchedule(List<Schedule> schedules){
        for(Schedule schedule : schedules){
            Integer maxIdSched = scheduleRepository.selectMaxIdSchedByIdPgm(schedule.getIdPgm());
            schedule.setIdSched((maxIdSched == null ? 1 : maxIdSched + 1));
            scheduleRepository.upsertSchedule(schedule);
        }
    }

    //주차별 강의계획서 조회
    public List<Schedule> selectAllSchedule(int idPgm){
        List<Schedule> schedules = scheduleRepository.selectAllSchedule(idPgm);
        return schedules;
    }



}
