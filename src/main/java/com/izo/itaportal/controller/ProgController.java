package com.izo.itaportal.controller;


import com.izo.itaportal.model.Category;
import com.izo.itaportal.model.ClassRoom;
import com.izo.itaportal.model.Program;
import com.izo.itaportal.service.CategoryService;
import com.izo.itaportal.service.ClassRoomService;
import com.izo.itaportal.service.ProgramService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class ProgController {

    @Autowired
    private ProgramService programService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ClassRoomService classRoomService;

    @GetMapping("/adminProgram")
    public String adminProgram(Model model) {
        model.addAttribute("cate", categoryService.getAllCategory());
        model.addAttribute("prog", programService.getAllPrograms());
        return "adminProgram/adminProgram";
    }


    @GetMapping("/categoryInput")
    public String categoryInput() {
        return "/adminProgram/categoryInput";
    }

    @PostMapping("/categoryInsert")
    public String categoryInsert(@ModelAttribute Category category) {
        categoryService.insertCategory(category);
        return "redirect:/adminProgram";
    }

    @GetMapping("/categoryUpdateInput")
    public String categoryUpdate(@ModelAttribute Category category,Model model,int cateId) {
        model.addAttribute("cate", categoryService.getCategoryById(cateId));
        return "adminProgram/categoryUpdateInput";
    }

    @PostMapping("/categoryUpdate")
    public String categoryUpdate(@ModelAttribute Category category) {
        categoryService.updateCategory(category);
        return "redirect:/adminProgram";
    }


    //-------------------------------------------------------------------

    @GetMapping("/progInput")
    public String progInput() {
        return "/adminProgram/progInput";
    }

    @PostMapping("/progInsert")
    public String progInputInsert(Program program) {

        programService.insertProgram(program);
        return "redirect:/adminProgram";
    }

    //-------------------------------------------------------------------
    @GetMapping("/adminClassRoom")
    public String classRoom(Model model) {
        model.addAttribute("classRoom",classRoomService.getAllClassRoom());
        return "/adminProgram/adminClassRoom";
    }


    @GetMapping("/classRoomInput")
    public String classRoomInput() {
        return "/adminProgram/classRoomInput";
    }

    @PostMapping("/classRoomInsert")
    public String classRoomInsert(ClassRoom classRoom) {
        classRoomService.insertClassRoom(classRoom);
        return "redirect:/adminClassRoom";
    }


}

