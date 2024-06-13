package com.izo.itaportal.service;

import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.model.Category;
import com.izo.itaportal.model.Program;
import com.izo.itaportal.repository.ProgramRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class ProgramService {
    @Autowired
    private ProgramRepository programRepository;
    @Autowired
    private ScheduleService scheduleService;

    public List<Program> getAllPrograms() {
        List<Program> programs = programRepository.selectProgram();
        return programs;
    }



    public ProgramAllDto selectProgramById(Integer idPgm) {
        return programRepository.selectProgramById(idPgm);

    }

    public ProgramAllDto selectProgramDetail(Integer idPgm) {
        return programRepository.selectProgramDetail(idPgm);
    }

    @Transactional
    public int insertProgram(Program program) {
        int insertProgram = programRepository.insert(program);
        if (insertProgram > 0) {
            int idPgm = program.getIdPgm();
            scheduleService.generateSchedulesForProgram(idPgm, program.getStDt(), program.getEndDt(),
                    program.getPgmTime());
        }
        return insertProgram;
    }

    public int updateProgram(Program program) {
        int updateProgram = programRepository.update(program);
        return updateProgram;
    }

    public int deleteProgram(Integer idPgm) {
        int deleteProgram = programRepository.delete(idPgm);
        return deleteProgram;
    }

    public int countAllPrograms() {
        return programRepository.countAllPrograms();
    }
    public List<Program> getProgramsPerPage(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return programRepository.getProgramsPerPage(offset, pageSize);
    }

    public List<Program> searchProgramByName(String keyword) {
        return programRepository.searchProgramByName(keyword);
    }


    //어드민-신청대기신청취소신청완료
    // 추가된 메서드
    public Program getProgramById(int idPgm) {
        return programRepository.findProgramById(idPgm);
    }

    //어드민 수강신청취소대기완료
    public List<Program> findAllPrograms() {
        return programRepository.findAllPrograms();
    }
}
