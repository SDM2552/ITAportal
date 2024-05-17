package com.izo.itaportal.service;

import com.izo.itaportal.model.Schedule;
import com.izo.itaportal.repository.ScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScheduleService {

    @Autowired
    ScheduleRepository scheduleRepository;

    public void insertSchedule(Schedule schedule){
        //5/17여기부터
    }
}
