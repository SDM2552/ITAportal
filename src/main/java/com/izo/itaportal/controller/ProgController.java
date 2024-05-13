package com.izo.itaportal.controller;


import com.izo.itaportal.model.Category;
import com.izo.itaportal.model.ClassRoom;
import com.izo.itaportal.model.Program;
import com.izo.itaportal.service.CategoryService;
import com.izo.itaportal.service.ClassRoomService;
import com.izo.itaportal.service.ProgramService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class ProgController {

    @Autowired
    private ProgramService programService;

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ClassRoomService classRoomService;

    @GetMapping("/categoryInput")
    public String categoryInput() {
        return "/program/categoryInput";
    }

    @PostMapping("/categoryInsert")
    public String categoryInsert(Category category) {
        categoryService.insertCategory(category);
        return "redirect:/categoryInput";
    }

    //-------------------------------------------------------------------
    @GetMapping("/classRoomInput")
    public String classRoomInput() {
        return "/program/classRoomInput";
    }

    @PostMapping("/classRoomInsert")
    public String classRoomInsert(ClassRoom classRoom) {
        classRoomService.insertClassRoom(classRoom);
        return "redirect:/classRoomInput";
    }


    //-------------------------------------------------------------------

    @GetMapping("/progInput")
    public String progInput() {
        return "/program/progInput";
    }

    @PostMapping("/progInsert")
    public String progInputInsert(Program program) {

        programService.insertProgram(program);
        return "redirect:/progInput";
    }


}

