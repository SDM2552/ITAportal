package com.izo.itaportal.repository;



import com.izo.itaportal.model.Admin;
import com.izo.itaportal.model.Professor;
import com.izo.itaportal.model.Student;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyPageRepository {
    public Student selectStudentById(int idUser);
    public Professor selectProfById(int idUser);
    public Admin selectAdminById(int idUser);


}
