package com.izo.itaportal;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.security.MessageDigest;
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
        jdbcTemplate.execute("INSERT INTO admin(name, birth, tel, gender, address, id_user)" +
                "VALUES ('관리자01', '990101', '010-1000-2000', 'M', '서울시 종로3가', '1234')");
        jdbcTemplate.execute("INSERT INTO student(name, birth, tel, gender, address, id_user)" +
                "VALUES ('김학생', '20020202', '010-2222-3333', 'M', '강원도', '2024')");
        jdbcTemplate.execute("INSERT INTO student(name, birth, tel, gender, address, id_user)" +
                "VALUES ('복학생', '19000130', '010-3333-4444', 'M', '경기도', '2023')");

        //강의리스트
        jdbcTemplate.execute("INSERT INTO program (id_pgm,id_cate,pgm_name,st_dt,end_dt,pgm_target,id_room,pgm_method,pgm_per,pgm_fee) "+
                "VALUES (1,1,'국제무역','2024-01-01','2024-05-31','대충성인',0301,'오프라인',30,100000)");


    }

}