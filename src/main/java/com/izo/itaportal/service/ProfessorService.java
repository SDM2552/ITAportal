package com.izo.itaportal.service;

import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.model.Professor;
import com.izo.itaportal.model.Program;
import com.izo.itaportal.repository.ProfessorRepository;
import com.izo.itaportal.repository.ProgramRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProfessorService {
    @Autowired
    private ProfessorRepository professorRepository;
    @Autowired
    ProgramRepository programRepository;

    public List<Professor> getAllProfessors() {
        return professorRepository.findAll();
    }

    public List<Program> selectPgmForProf(int idProf){
        return programRepository.selectPgmForProf(idProf);
    }
    public List<ProgramAllDto> selectAllPgmForProf(int idProf){
        return programRepository.selectAllPgm(idProf);
    }
    public ProgramAllDto selectPgmDetail(int idProf, int idPgm) {
        return programRepository.selectPgmDetail(idProf, idPgm);
    }
}
