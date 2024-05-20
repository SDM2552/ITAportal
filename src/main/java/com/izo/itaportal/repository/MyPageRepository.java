package com.izo.itaportal.repository;



import com.izo.itaportal.model.Admin;
import com.izo.itaportal.model.Professor;
import com.izo.itaportal.model.Student;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyPageRepository {
    public Student selectStudentById(Integer idUser);
    public Professor selectProfById(Integer idUser);
    public Admin selectAdminById(Integer idUser);

    public int updateStudent(Student student);
    public int updateProf(Professor professor);
    public int updateAdmin(Admin admin);

    public int deleteStudent(Integer idUser);
    public int deleteProf(Integer idUser);
    public int deleteAdmin(Integer idUser);
    public int deleteUser(Integer idUser);


}
