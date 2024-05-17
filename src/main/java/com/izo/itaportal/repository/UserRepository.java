package com.izo.itaportal.repository;

import com.izo.itaportal.model.User;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserRepository {



    void insertUser(User user); // 신규 유저 등록

}
