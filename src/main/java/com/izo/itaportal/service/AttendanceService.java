package com.izo.itaportal.service;

import com.izo.itaportal.repository.AttendanceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AttendanceService {
    @Autowired
    private AttendanceRepository attendanceRepository;

    public void saveScore(int idStudent, int idPgm, int score) {
        attendanceRepository.updateScore(idStudent, idPgm, score);
    }
}
