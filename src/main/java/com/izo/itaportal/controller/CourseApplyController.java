package com.izo.itaportal.controller;

import com.izo.itaportal.model.CourseApply;
import com.izo.itaportal.service.CourseApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/course") // 기본 경로 설정
public class CourseApplyController {
    @Autowired
    private CourseApplyService courseApplyService;

    @GetMapping("/enrollcourse")
    public String showEnrollmentForm() {
        System.out.println("Page access log: enrollcourse page accessed.");
        return "enrollcourse";  // 'enrollcourse.jsp' 파일을 렌더링합니다.
    }
    @GetMapping("/applylist")
    public String courselist() {
         return "courselist";
    }


    @PostMapping("/apply")
    public ResponseEntity<?> applyForCourse(@RequestBody CourseApply courseApply) {
        courseApplyService.applyForCourse(courseApply);
        return ResponseEntity.ok("수강 신청이 완료되었습니다.");
    }

    @GetMapping("/all")
    public ResponseEntity<List<CourseApply>> getAllCourseApplies() {
        return ResponseEntity.ok(courseApplyService.getAllCourseApplies());
    }
}