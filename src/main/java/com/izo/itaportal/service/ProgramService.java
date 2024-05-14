package com.izo.itaportal.service;

import com.izo.itaportal.model.Program;
import com.izo.itaportal.repository.ProgramRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProgramService {
    @Autowired
    private ProgramRepository programRepository;

    public List<Program> getAllPrograms() {
        List<Program> programs = programRepository.selectProgram();
        return programs;
    }

    public int insertProgram(Program program) {
        int insertProgram = programRepository.insert(program);
        return insertProgram;
    }

    public int updateProgram(Program program) {
        int updateProgram = programRepository.update(program);
        return updateProgram;
    }

    public int deleteProgram(int idPgm) {
        int deleteProgram = programRepository.delete(idPgm);
        return deleteProgram;
    }

}
