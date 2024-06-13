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
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    SearchService searchService;

    @GetMapping("/program")
    @ResponseBody
    public Map<String, Object> searchPrograms(@RequestParam(value = "cateName", required = false) String cateName,
                                              @RequestParam(value = "pgmName", required = false) String pgmName) {
        List<ProgramSearchDto> programs = searchService.searchProgramsByCategoryAndName(cateName, pgmName);
        Map<String, Object> response = new HashMap<>();
        response.put("programs", programs);
        return response;
    }

    @GetMapping("/list")
    public String listPrograms(Model model) {
        List<CategoryDto> categories = searchService.getAllCategories();
        model.addAttribute("categories", categories);
        return "search/programList";
    }

    @GetMapping("/program/ajax")
    @ResponseBody
    public List<ProgramSearchDto> searchProgramsAjax(@RequestParam(value = "cateName", required = false) String cateName,
                                                     @RequestParam(value = "pgmName", required = false) String pgmName) {
        return searchService.searchProgramsByCategoryAndName(cateName, pgmName);
    }
}
