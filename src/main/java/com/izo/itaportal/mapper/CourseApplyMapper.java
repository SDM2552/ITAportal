package com.izo.itaportal.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.izo.itaportal.model.CourseApply;
import java.util.List;

@Mapper
public interface CourseApplyMapper {
    void insertCourseApply(CourseApply courseApply);
    List<CourseApply> findAllCourseApplies();

    List<CourseApply> findCoursesByIdStudent(int IdStudent);
}