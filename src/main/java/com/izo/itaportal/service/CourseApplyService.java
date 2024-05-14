package com.izo.itaportal.service;

import com.izo.itaportal.mapper.CourseApplyMapper;
import com.izo.itaportal.model.CourseApply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseApplyService {
    @Autowired
    private CourseApplyMapper courseApplyMapper;

    public void applyForCourse(CourseApply courseApply) {
        courseApplyMapper.insertCourseApply(courseApply);
    }

    public List<CourseApply> getAllCourseApplies() {
        return courseApplyMapper.findAllCourseApplies();
    }

    public List<CourseApply> getCoursesByIdStudent(int idStudent) {
        return courseApplyMapper.findCoursesByIdStudent(idStudent);
    }

}
