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
                "VALUES ('[통관 및 관세 실무 이해] 개강일자 변경 안내','통관 및 관세 실무 이해 1차 강의가 본교 사정으로 인하여 개강일자가 변경 됩니다.\n" +
                "\n" +
                "일정에 참고하시기 바랍니다\n" +
                "\n" +
                " \n" +
                "\n" +
                "- 교육일정: 5월25일(토) ~ 7월 14일(일)\n" +
                "\n" +
                "- 접수일정: 4월22일(월) ~ 5월 3일(금)','2024-05-02 15:30:00',0)");
        jdbcTemplate.execute("INSERT INTO notice(title, content, created_date, views) " +
                "VALUES ('[검색 엔진 최적화(SEO) 원리] 프로그램 개설 안내', '[디지털마케팅] 검색 엔진 최적화(SEO) 원리 프로그램 안내\n" +
                "\n" +
                "1. 교육일정\n" +
                "\n" +
                " - 개강일자 : 2024. 06. 03(토) ~ 2024. 08. 27(일)\n" +
                "\n" +
                " - 교육시수 : 26회 (총130시간)\n" +
                "\n" +
                " - 강의요일 : 매주 토,일 13:00~ 18:00\n" +
                "\n" +
                " - 강의장소 : 이대캠퍼스 302호\n" +
                "\n" +
                "\n" +
                "\n" +
                "2. 신청방법 및 선별방법\n" +
                "\n" +
                " - 신청방법 : 개별전화 신청 (T. 000-123-1234~5,5678)\n" +
                "\n" +
                " - 선별방법 : 개별 면접 진행\n" +
                "\n" +
                "\n" +
                "\n" +
                "3. 문의사항\n" +
                "\n" +
                " - 안양시HiVE센터 T.000-123-1234~5,5678\n" +
                "\n" +
                " - 최박사 교수 T.010-7777-0000', '2024-05-03 09:32:33', 0)");

        jdbcTemplate.execute("INSERT INTO notice(title, content, created_date, views) " +
                "VALUES ('[자유무역협정(FTA) 실무] 교육생 모집', '2024 자유무역협정(FTA) 실무 교육생 모집\n" +
                "□교육개요\n" +
                "1. 교육대상 : 무역 관련 재직자 및 재직희망자\n" +
                "2. 교육기간 : 2024. 5. 8.(수) ~ 11. 1(금)\n" +
                "3. 교육내용 : FTA 및 실무에 효율을 높이는 28개 과정\n" +
                "    *교육과정은 붙임 참조, 과정별 세부내용은 홈페이지 참조\n" +
                "4. 교육방법 : 실시간 온라인 및 오프라인 교육\n" +
                "5. 교육비용 : 75000 원\n" +
                "\n" +
                "□ 모집안내\n" +
                "1. 모집대상 : 무역 전공자, 관련 재직자, 업계 취업 희망자 등\n" +
                "2. 모집기간 : 2024. 5. 29(월) ~ 10. 31(목)\n" +
                "3. 모집방법 : 홈페이지(localhost.kr) 온라인 접수\n" +
                "    *매월 세번째 월요일부터 다음달 교육과정 선착순 접수 진행\n" +
                "4. 교육수료생 지원‧혜택\n" +
                "★ 교육 수료증 발급 및 중식 제공(온라인 교육 시 바우처 제공)\n" +
                "★ 우수 교육생 및 우수 교육팀 시상품 제공\n" +
                "5. 관련문의 : ☎ 02-111-2222', '2024-05-05 12:23:07', 0)");
        jdbcTemplate.execute("INSERT INTO notice(title, content, created_date, views) " +
                "VALUES ('디지털 마케팅 혁신 특강 모집 안내', '행복진흥사회서비스원에서 『디지털 마케팅 혁신이 가져오는 시대 선도』 특강을 진행하오니 많은 참여 바랍니다.\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "1. 특강명: 디지털 마케팅 혁신이 가져오는 시대 선도\n" +
                "\n" +
                "2. 특강일시: 2024. 05. 28.(화) 19:00\n" +
                "\n" +
                "3. 특강장소: 무역센터 2층 시청각실\n" +
                "\n" +
                "4. 강연자: 이성계(디지털 마케팅 연구센터 센터장)\n" +
                "\n" +
                "5. 참여대상: 청년 대상 200명(만19세~39세)\n" +
                "\n" +
                "6. 신청기간: 2023. 05. 20.(월) ~ 06. 03.(화) 13:00\n" +
                "\n" +
                "7. 신청방법(2중 택1)\n" +
                "  - 구글 폼 신청: https://forms.gle/1234\n" +
                "  - 홈페이지 회원가입 후 오프라인 강좌 신청\n" +
                "\n" +
                "8. 문의사항: 국제무역아카데미 평생교육사업팀 \n" +
                "\n" +
                "    000-111-5555, 000-222-5555', '2024-05-06 17:01:54', 0)");
    }


}