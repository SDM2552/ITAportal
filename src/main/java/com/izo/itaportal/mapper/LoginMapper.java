package com.izo.itaportal.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface LoginMapper {

    @Select("SELECT password FROM user WHERE login_id = #{loginId}")
    String getPasswordByLoginId(@Param("loginId") String loginId);

}
