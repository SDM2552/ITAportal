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
        jdbcTemplate.execute("INSERT INTO student(name, birth, tel, gender, address, id_user)" +
                "VALUES ('홍길동', '196001231', '010-5555-6666', 'M', '경기도', '6')");
        jdbcTemplate.execute("INSERT INTO user(id_user, login_id, password, regist_date, email, role) " +
                "VALUES(1, 'stu', '" + encryptedPassword + "', '2024-05-17', 'kim@email.com', 'stu')");
        jdbcTemplate.execute("INSERT INTO user(id_user, login_id, password, regist_date, role) " +
                "VALUES(2, 'prof', '" + encryptedPassword + "', '2024-05-19', 'prof')");
        jdbcTemplate.execute("INSERT INTO user(id_user, login_id, password, regist_date, role) " +
                "VALUES(3, 'prof2', '" + encryptedPassword + "', '2024-05-23', 'prof')");
        jdbcTemplate.execute("INSERT INTO user(id_user, login_id, password, regist_date, role) " +
                "VALUES(4, 'admin', '" + encryptedPassword + "', '2024-05-18', 'admin')");
        jdbcTemplate.execute("INSERT INTO user(id_user, login_id, password, regist_date, email, role) " +
                "VALUES(5, 'stu2', '" + encryptedPassword + "', '2024-05-22', 'bok@email.com', 'stu')");
        jdbcTemplate.execute("INSERT INTO user(id_user, login_id, password, regist_date, email, role) " +
                "VALUES(6, 'stu3', '" + encryptedPassword + "', '2024-05-22', 'hong@email.com', 'stu')");


        //강의리스트
        jdbcTemplate.execute("INSERT INTO program (id_cate,pgm_name,st_dt,end_dt,sugang_st_dt,sugang_end_dt,pgm_target,id_room,pgm_method,pgm_per, num_of_stu, pgm_fee,id_prof) "+
                "VALUES (2,'통관 및 관세 실무 이해','2024-11-09','2024-11-10','2024-10-15','2024-10-30','통관 및 관세에 관심이 있는 재직자',1,'오프라인',10,0,55000,1)");
        jdbcTemplate.execute("INSERT INTO program (id_cate,pgm_name,st_dt,end_dt,sugang_st_dt,sugang_end_dt,pgm_target,id_room,pgm_method,pgm_per, num_of_stu, pgm_fee,id_prof) "+
                "VALUES (1,'자유무역협정(FTA) 실무','2024-06-01','2024-08-31','2024-10-15','2024-10-30','자유무역에 관심이 있는 성인',99,'온라인',30,1,75000,2)");
        jdbcTemplate.execute("INSERT INTO program (id_cate,pgm_name,st_dt,end_dt,sugang_st_dt,sugang_end_dt,pgm_target,id_room,pgm_method,pgm_per, num_of_stu, pgm_fee,id_prof) "+
                "VALUES (3,'검색 엔진 최적화(SEO) 원리','2024-06-01','2024-08-31','2024-10-15','2024-10-30','SEO를 통한 마케팅에 관심있는 전공자',1,'오프라인',30,2,35000,1)");



        //강의계획서
        jdbcTemplate.execute("INSERT INTO syllabus (id_pgm, course_overview, objective, teaching, book, evaluation, remarks, id_prof)" +
                "VALUES (1, '임시데이터', '임시데이터', '온라인', '임시데이터', '임시데이터', '임시데이터', 1)");
        //주차별 강의계획서
        jdbcTemplate.execute("INSERT INTO schedule (id_pgm, day_sched, start_sched, end_sched, learning_contents, learning_detail, note)" +
                "VALUES (1, '2024-05-20', '09:00:00', '12:00:00', '관세선의 개념에 대해 이해한다.', '대면수업', '오티랑 함께 진행합니다~~!')");
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

        //수강
        jdbcTemplate.execute("INSERT INTO sugang(id_sugang, id_student, id_cate, id_pgm, st_dt, status,course_status)" +
                "VALUES (1,1,3,3,'2024-05-22 12:47:53','신청중',0)");
        jdbcTemplate.execute("INSERT INTO sugang(id_sugang, id_student, id_cate, id_pgm, st_dt, status,course_status)" +
                "VALUES (2,1,1,2,'2024-05-22 12:47:53','신청 완료',1)");
        jdbcTemplate.execute("INSERT INTO sugang(id_sugang, id_student, id_cate, id_pgm, st_dt, status,course_status)" +
                "VALUES (3,2,3,3,'2024-05-22 12:47:53','신청 완료',1)");
        jdbcTemplate.execute("INSERT INTO sugang(id_sugang, id_student, id_cate, id_pgm, st_dt, status,course_status)" +
                "VALUES (4,3,3,3,'2024-05-22 12:47:53','신청 완료',1)");
        // id_pgm 1에 대한 출석 데이터 추가
        jdbcTemplate.execute("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat) " +
                "VALUES (2, 1, 0,0,0)");
        jdbcTemplate.execute("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat) " +
                "VALUES (3, 2, 0,0,0)");
        jdbcTemplate.execute("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat) " +
                "VALUES (3, 3, 0,0,0)");


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
                "- 접수일정: 4월22일(월) ~ 5월 3일(금)','2024-05-02 15:30:00',0)");
        jdbcTemplate.execute("INSERT INTO notice(title, content, created_date, views)" +
                "VALUES ('공지사항 제목2','공지사항 내용2',now(),0)");
    }

}