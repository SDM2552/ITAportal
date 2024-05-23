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
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
public class ProgController {

    @Autowired
    private ProgramService programService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ClassRoomService classRoomService;
    @Autowired
    private HttpSession httpSession;

    @GetMapping("/adminProgram")
    public String adminProgram(Model model) {
        model.addAttribute("cate", categoryService.getAllCategory());
        model.addAttribute("prog", programService.getAllPrograms());
        return "adminProgram/adminProgram";
    }

    @GetMapping("/adminClassRoom")
    public String classRoom(Model model) {
        model.addAttribute("classRoom",classRoomService.getAllClassRoom());
        return "/adminProgram/adminClassRoom";
    }

    //-------------------------------------------------------------------


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
    public String categoryUpdate(@ModelAttribute Category category,Model model,int idCate) {
        model.addAttribute("cate", categoryService.getCategoryById(category.getIdCate()));
        return "adminProgram/categoryUpdateInput";
    }

    @PostMapping("/categoryUpdate")
    public String categoryUpdate(@ModelAttribute Category category) {
        categoryService.updateCategory(category);
        return "redirect:/adminProgram";
    }

    @GetMapping("/categoryDelete")
    public String categoryDelete(int idCate) {
        categoryService.deleteCategory(idCate);
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

    @GetMapping("/progUpdateInput")
    public String progUpdateInput(int idPgm,Model model) {
        model.addAttribute("pr",programService.selectCategoryById(idPgm));
        return "adminProgram/progUpdateInput";
    }

    @PostMapping("/progUpdate")
    public String progUpdate(@ModelAttribute Program program) {
        programService.updateProgram(program);
        return "redirect:/adminProgram";
    }

    @GetMapping("/progDelete")
    public String progDelete(int idPgm) {
        programService.deleteProgram(idPgm);
        return "redirect:/adminProgram";
    }

    //-------------------------------------------------------------------



    @GetMapping("/classRoomInput")
    public String classRoomInput() {
        return "/adminProgram/classRoomInput";
    }

    @PostMapping("/classRoomInsert")
    public String classRoomInsert(ClassRoom classRoom) {
        classRoomService.insertClassRoom(classRoom);
        return "redirect:/adminClassRoom";
    }

    @GetMapping("/classRoomUpdateInput")
    public String classRoomUpdateInput(int idRoom,Model model) {
        model.addAttribute("cr",classRoomService.getClassRoomById(idRoom));
        return "adminProgram/classRoomUpdateInput";
    }

    @PostMapping("/classRoomUpdate")
    public String classRoomUpdate(@ModelAttribute ClassRoom classRoom) {
        classRoomService.updateClassRoom(classRoom);
        return "redirect:/adminClassRoom";
    }

    @GetMapping("/classRoomDelete")
    public String classRoomDelete(int idRoom) {
        classRoomService.deleteClassRoom(idRoom);
        return "redirect:/adminClassRoom";
    }

    @GetMapping("progInfo")
    public String programInfo(Model model,Integer idPgm) {
        model.addAttribute("pr", programService.selectProgramDetail(idPgm));
        return "/adminProgram/progInfo";
    }


}

