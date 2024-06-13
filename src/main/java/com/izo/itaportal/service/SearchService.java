package com.izo.itaportal.service;

import com.izo.itaportal.dto.ProgramSearchDto;
import com.izo.itaportal.dto.CategoryDto;
import com.izo.itaportal.repository.SearchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class SearchService {

    @Autowired
    SearchRepository searchRepository;

    public List<ProgramSearchDto> searchProgramsByCategoryAndName(String cateName, String pgmName) {
        List<ProgramSearchDto> programs = searchRepository.searchProgramsByCategoryAndName(cateName, pgmName);
        for (ProgramSearchDto program : programs) {
            checkSugangClosed(program);
        }
        return programs;
    }

    public List<CategoryDto> getAllCategories() {
        return searchRepository.findAllCategories();
    }

    private void checkSugangClosed(ProgramSearchDto program) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate endDate = LocalDate.parse(program.getSugangEndDt(), formatter);
        boolean isClosed = LocalDate.now().isAfter(endDate);
        program.setSugangClosed(isClosed);
    }
}
