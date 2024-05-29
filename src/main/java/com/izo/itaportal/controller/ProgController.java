package com.izo.itaportal.controller;


import com.izo.itaportal.model.Category;
import com.izo.itaportal.model.ClassRoom;
import com.izo.itaportal.model.Program;
import com.izo.itaportal.service.CategoryService;
import com.izo.itaportal.service.ClassRoomService;
import com.izo.itaportal.service.ProfessorService;
import com.izo.itaportal.service.ProgramService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class ProgController {

    @Autowired
    private ProgramService programService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ClassRoomService classRoomService;
    @Autowired

    private ProfessorService professorService;
    @Autowired

    private HttpSession httpSession;

    private static final int PAGE_SIZE = 7;


    @GetMapping("/adminProgram")
    public String adminProgram(@RequestParam(name = "page", defaultValue = "1") int page, Model model) {
        // 전체 프로그램 수를 가져옵니다.
        int totalPrograms = programService.countAllPrograms();

        // 전체 페이지 수를 계산합니다.
        int totalPages = (int) Math.ceil((double) totalPrograms / PAGE_SIZE);

        // 현재 페이지의 프로그램 목록을 가져옵니다.
        List<Program> programs = programService.getProgramsPerPage(page, PAGE_SIZE);


        model.addAttribute("prog", programs);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);

        return "adminProgram/adminProgram";
    }

    @GetMapping("/adminCategory")
    public String adminCategory(@RequestParam(name = "page", defaultValue = "1") int page, Model model) {
        int totalCategories = categoryService.countAllCategories();

        int totalPages = (int) Math.ceil((double) totalCategories / PAGE_SIZE);

        List<Category> categories = categoryService.getCategoriesPerPage(page, PAGE_SIZE);


        model.addAttribute("cate", categories);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        return "adminProgram/adminCategory";
    }

    @GetMapping("/adminClassRoom")
    public String classRoom(@RequestParam(name = "page", defaultValue = "1") int page, Model model) {
        int totalClassRooms = classRoomService.countAllClassRooms();

        int totalPages = (int) Math.ceil((double) totalClassRooms / PAGE_SIZE);

        List<ClassRoom> classRooms = classRoomService.getClassRoomsPerPage(page, PAGE_SIZE);

        model.addAttribute("classRoom", classRooms);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
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
        return "redirect:/adminCategory";
    }

    @GetMapping("/categoryUpdateInput")
    public String categoryUpdate(@ModelAttribute Category category, Model model, int idCate) {
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
    public String progInputInsert(@ModelAttribute Program program) {
        programService.insertProgram(program);
        return "redirect:/adminProgram";
    }

    @GetMapping("/progUpdateInput")
    public String progUpdateInput(Integer idPgm, Model model) {
        model.addAttribute("pr", programService.selectProgramById(idPgm));
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
    public String classRoomUpdateInput(int idRoom, Model model) {
        model.addAttribute("cr", classRoomService.getClassRoomById(idRoom));
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
    public String programInfo(Model model, Integer idPgm) {
        model.addAttribute("pr", programService.selectProgramDetail(idPgm));
        return "/adminProgram/progInfo";
    }


    //-------------------------------------------------------------------------------------------------------

    @GetMapping("/catePopUp")
    public String progPopUp(Model model) {
        model.addAttribute("cate", categoryService.getAllCategory());
        return "/adminProgramPopUp/catePopUp";
    }

    @GetMapping("/classRoomPopUp")
    public String classRoomPopUp(Model model) {
        model.addAttribute("classRoom", classRoomService.getAllClassRoom());
        return "/adminProgramPopUp/classRoomPopUp";
    }

    @GetMapping("/profPopUp")
    public String profPopUp(Model model) {
        model.addAttribute("prof", professorService.getAllProfessors());
        return "/adminProgramPopUp/profPopUp";
    }


}

