package com.izo.itaportal.service;

import com.izo.itaportal.model.Program;
import com.izo.itaportal.repository.CourseStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseStatusService {

    @Autowired
    private CourseStatusRepository courseStatusRepository;

    public Program selectProgramByIdPgm(int idPgm) {
        return courseStatusRepository.selectProgramByIdPgm(idPgm);
    }

}
