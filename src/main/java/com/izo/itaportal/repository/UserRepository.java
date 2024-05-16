package com.izo.itaportal.repository;

import com.izo.itaportal.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserRepository {

    @Select("select * from User where login_id = #{loginId}")
    User findByLoginId(String loginId); //이미 가입한 ID인지 중복 체크용

    void insertUser(User user); // 신규 유저 등록
}
