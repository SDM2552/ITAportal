package com.izo.itaportal.controller;

import com.izo.itaportal.dto.ProgramSearchDto;
import com.izo.itaportal.dto.CategoryDto;
import com.izo.itaportal.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    SearchService searchService;

    @GetMapping("/program")
    public String searchPrograms(@RequestParam(value = "cateName", required = false) String cateName,
                                 @RequestParam(value = "pgmName", required = false) String pgmName,
                                 Model model) {
        List<ProgramSearchDto> programs = searchService.searchProgramsByCategoryAndName(cateName, pgmName);
        List<CategoryDto> categories = searchService.getAllCategories();
        model.addAttribute("programs", programs);
        model.addAttribute("categories", categories);
        return "search/programSearchResult";
    }

    @GetMapping("/list")
    public String listPrograms(Model model) {
        List<CategoryDto> categories = searchService.getAllCategories();
        model.addAttribute("categories", categories);
        return "search/programList";
    }
}
