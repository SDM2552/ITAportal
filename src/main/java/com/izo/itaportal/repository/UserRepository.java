package com.izo.itaportal.repository;

import com.izo.itaportal.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserRepository {

public String getPasswordByLoginId(String LoginId);
}
