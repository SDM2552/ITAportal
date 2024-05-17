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

    public int updateStudent(Student student);
    public int updateProf(Professor professor);
    public int updateAdmin(Admin admin);

    public int deleteStudent(int idUser);
    public int deleteProf(int idUser);
    public int deleteAdmin(int idUser);



}
