package com.izo.itaportal.repository;


import com.izo.itaportal.model.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyPageRepository {
    public Student selectStudentById(Integer idUser);

    public Professor selectProfById(Integer idUser);

    public Admin selectAdminById(Integer idUser);

    public User selectUserById(Integer idUser);

    public int updateStudent(SignUpRequest signUpRequest);

    public int updateProf(SignUpRequest signUpRequest);

    public int updateAdmin(SignUpRequest signUpRequest);

    public int updatePassword(Integer idUser, String newPassword);

    public int updateEmail(SignUpRequest signUpRequest);

    public int deleteStudent(Integer idUser);

    public int deleteProf(Integer idUser);

    public int deleteAdmin(Integer idUser);

    public int deleteUser(Integer idUser);


}
