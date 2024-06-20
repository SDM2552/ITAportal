package com.izo.itaportal.service;

import com.izo.itaportal.dto.GradeDto;
import com.izo.itaportal.repository.AttendanceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttendanceService {
    @Autowired
    private AttendanceRepository attendanceRepository;

    public void saveScore(int idStudent, int idPgm, int score) {
        attendanceRepository.updateScore(idStudent, idPgm, score);
    }
    public List<GradeDto> selectGradeByIdStudent(int idStudent){
        return attendanceRepository.selectGradeByIdStudent(idStudent);
    }
}
