package com.izo.itaportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/program")
public class SugangController {

    @GetMapping("/list")
    public String programList(){
        return "sugang/sugangList";
    }

    @GetMapping("/applyForm")
    public String programDetail(){
        return "sugang/sugangDetail";
    }
}
