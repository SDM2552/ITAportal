package com.izo.itaportal.service;

import com.izo.itaportal.dto.ProgramSearchDto;
import com.izo.itaportal.dto.CategoryDto;
import com.izo.itaportal.repository.SearchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchService {

    @Autowired
    SearchRepository searchRepository;

    public List<ProgramSearchDto> searchProgramsByCategoryAndName(String cateName, String pgmName) {
        return searchRepository.searchProgramsByCategoryAndName(cateName, pgmName);
    }

    public List<CategoryDto> getAllCategories() {
        return searchRepository.findAllCategories();
    }
}
