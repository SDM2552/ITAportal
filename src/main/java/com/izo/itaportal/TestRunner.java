package com.izo.itaportal;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
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
    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public void run(ApplicationArguments args) throws Exception {

        Connection connection = dataSource.getConnection();
        String encryptedPassword = passwordEncoder.encode("1234");

        //JdbcTemplete
        //member
        jdbcTemplate.execute("INSERT INTO professor(name, birth, tel, gender, address, id_user)" +
                "VALUES ('김교수02', '950320', '010-1234-1234', 'F', '경기도 고양시 어쩌구', '2')");
        jdbcTemplate.execute("INSERT INTO professor(name, birth, tel, gender, address, id_user)" +
                "VALUES ('박교수03', '931231', '010-9876-5432', 'M', '서울시 성북구 근처', '3')");
        jdbcTemplate.execute("INSERT INTO admin(name, birth, tel, gender, address, id_user)" +
                "VALUES ('관리자01', '990101', '010-1000-2000', 'M', '서울시 종로3가', '4')");
        jdbcTemplate.execute("INSERT INTO student(name, birth, tel, gender, address, id_user)" +
                "VALUES ('김학생01', '20020202', '010-2222-3333', 'M', '강원도', '1')");
        jdbcTemplate.execute("INSERT INTO student(name, birth, tel, gender, address, id_user)" +
                "VALUES ('복학생', '19000130', '010-3333-4444', 'M', '경기도', '5')");
        jdbcTemplate.execute("INSERT INTO user(id_user, login_id, password, regist_date, role) " +
                "VALUES(1, 'stu', '" + encryptedPassword + "', '2024-05-17', 'stu')");
        jdbcTemplate.execute("INSERT INTO user(id_user, login_id, password, regist_date, role) " +
                "VALUES(2, 'prof', '" + encryptedPassword + "', '2024-05-19', 'prof')");
        jdbcTemplate.execute("INSERT INTO user(id_user, login_id, password, regist_date, role) " +
                "VALUES(4, 'admin', '" + encryptedPassword + "', '2024-05-18', 'admin')");

        //강의리스트
        jdbcTemplate.execute("INSERT INTO program (id_cate,pgm_name,st_dt,end_dt,sugang_st_dt,sugang_end_dt,pgm_target,id_room,pgm_method,pgm_per, num_of_stu, pgm_fee,id_prof) "+
                "VALUES (2,'통관 및 관세 실무 이해','2024-11-09','2024-11-10','2024-10-15 09:00','2024-10-30 18:00','통관 및 관세에 관심이 있는 재직자',1,'오프라인',10,0,55000,1)");
        jdbcTemplate.execute("INSERT INTO program (id_cate,pgm_name,st_dt,end_dt,sugang_st_dt,sugang_end_dt,pgm_target,id_room,pgm_method,pgm_per, num_of_stu, pgm_fee,id_prof) "+
                "VALUES (1,'자유무역협정(FTA) 실무','2024-06-01','2024-08-31','2024-10-15 09:00','2024-10-30 18:00','자유무역에 관심이 있는 성인',99,'온라인',30,0,75000,2)");
        jdbcTemplate.execute("INSERT INTO program (id_cate,pgm_name,st_dt,end_dt,sugang_st_dt,sugang_end_dt,pgm_target,id_room,pgm_method,pgm_per, num_of_stu, pgm_fee,id_prof) "+
                "VALUES (3,'검색 엔진 최적화(SEO) 원리','2024-06-01','2024-08-31','2024-10-15 09:00','2024-10-30 18:00','SEO를 통한 마케팅에 관심있는 전공자',1,'오프라인',30,0,35000,1)");


        //강의계획서
        jdbcTemplate.execute("INSERT INTO syllabus (id_pgm, course_overview, objective, teaching, book, evaluation, remarks, id_prof)" +
                "VALUES (1, '임시데이터', '임시데이터', '온라인', '임시데이터', '임시데이터', '임시데이터', 1)");
        //강의실
        jdbcTemplate.execute("INSERT INTO class_room VALUES (1,'이대캠퍼스 301호')");
        jdbcTemplate.execute("INSERT INTO class_room VALUES (99,'온라인 학습 관리 시스템(LMS)')");
        //카테고리
        jdbcTemplate.execute("INSERT INTO category VALUES (1,'국제통상정책')");
        jdbcTemplate.execute("INSERT INTO category VALUES (2,'무역거래실무')");
        jdbcTemplate.execute("INSERT INTO category VALUES (3,'디지털마케팅')");
        jdbcTemplate.execute("INSERT INTO category VALUES (4,'공급망관리(SCM)')");
        jdbcTemplate.execute("INSERT INTO category VALUES (5,'인적자원관리')");
        jdbcTemplate.execute("INSERT INTO category VALUES (6,'일반교양')");

        //exam
        jdbcTemplate.execute("INSERT INTO exam(name, start_date, end_date, status, count, description, id_program, id_prof, id_file)" +
                "VALUES ('통관 및 관세 실무 이해', '2024-05-10', '2024-05-24', '진행중?', '1', '수업 내용을 요약해서 레포트로 제출할 것.','100','2024001','9999')");

        jdbcTemplate.execute("INSERT INTO exam_submission(id_program, id_exam, id_student, id_file)" +
                "VALUES ('100', '1', '2', '9999')");

        //enrollment
        jdbcTemplate.execute("INSERT INTO enrollment(id_enrollment, id_cate, id_pgm, id_student, pgm_name, st_dt, status)" +
                "VALUES ('100','1','2','3','무역을합시다','2024-05-16','보류 중')");

        //공지사항 글
        jdbcTemplate.execute("INSERT INTO notice(title, content, created_date, views)" +
                "VALUES ('[무역실무기초] 개강일자 변경 안내','무역실무기초 1차 강의가 본교 사정으로 인하여 개강일자가 변경 됩니다.\n" +
                "\n" +
                "일정에 참고하시기 바랍니다\n" +
                "\n" +
                " \n" +
                "\n" +
                "- 교육일정: 5월25일(토) ~ 7월 14일(일)\n" +
                "\n" +
                "- 접수일정: 4월22일(월) ~ 5월 3일(금)',now(),0)");
        jdbcTemplate.execute("INSERT INTO notice(title, content, created_date, views)" +
                "VALUES ('공지사항 제목2','공지사항 내용2',now(),0)");
    }

}