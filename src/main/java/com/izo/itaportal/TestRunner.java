package com.izo.itaportal;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Connection;

@Component
@Slf4j
public class TestRunner implements ApplicationRunner{

    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public void run(ApplicationArguments args) throws Exception {

        Connection connection = dataSource.getConnection();

        //JdbcTemplete
        //member
        jdbcTemplate.execute("INSERT INTO professor(name, birth, tel, gender, address, id_user)" +
                "VALUES ('김교수', '950320', '010-1234-1234', 'F', '경기도 고양시 어쩌구', '1')");
        jdbcTemplate.execute("INSERT INTO professor(name, birth, tel, gender, address, id_user)" +
                "VALUES ('박교수', '9301231', '010-9876-5432', 'M', '서울시 성북구 근처', '24001')");
        jdbcTemplate.execute("INSERT INTO admin(name, birth, tel, gender, address, id_user, id_user2)" +
                "VALUES ('관리자01', '990101', '010-1000-2000', 'M', '서울시 종로3가', '1234', '1234')");
        jdbcTemplate.execute("INSERT INTO student(name, birth, tel, gender, address, id_user)" +
                "VALUES ('김학생', '20020202', '010-2222-3333', 'M', '강원도', '2024')");
        jdbcTemplate.execute("INSERT INTO student(name, birth, tel, gender, address, id_user)" +
                "VALUES ('복학생', '19000130', '010-3333-4444', 'M', '경기도', '2023')");


    }

}