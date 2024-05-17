package com.izo.itaportal.repository;

import com.izo.itaportal.model.Schedule;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleRepository {
    public void insertSchedule(Schedule schedule);
}
