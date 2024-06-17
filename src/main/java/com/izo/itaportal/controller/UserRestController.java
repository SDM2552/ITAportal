package com.izo.itaportal.controller;

import com.izo.itaportal.model.Student;
import com.izo.itaportal.service.CategoryService;
import com.izo.itaportal.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class UserRestController {
    @Autowired
    private StudentService studentService;

    @Autowired
    private CategoryService categoryService;
    @GetMapping("/checkSession")
    public Map<String, Boolean> checkSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Map<String, Boolean> response = new HashMap<>();
        if (session == null || session.getAttribute("loginUser") == null) {
            response.put("isLoggedIn", false);
        } else {
            response.put("isLoggedIn", true);
        }
        return response;
    }
}
