package com.izo.itaportal.service;

import com.izo.itaportal.dto.ProgramAllDto;
import com.izo.itaportal.repository.SugangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SugangService {

    @Autowired
    SugangRepository sugangRepository;

    public List<ProgramAllDto> getAllProgram(){
        return sugangRepository.findAll();
    }
}
