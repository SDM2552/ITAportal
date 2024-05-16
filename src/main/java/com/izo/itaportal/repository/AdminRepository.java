package com.izo.itaportal.repository;

import com.izo.itaportal.model.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AdminRepository  {
    @Select("SELECT * FROM admin")
    public List<Admin> findAll();

    void insertAdmin(Admin admin); // 관리자 등록

}
