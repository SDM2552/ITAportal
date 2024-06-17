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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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

        try (Connection connection = dataSource.getConnection();
             Statement stmt = connection.createStatement()) {

            // id 자동증가값 시작 변경
            stmt.execute("ALTER TABLE student AUTO_INCREMENT = 2024001");
            stmt.execute("ALTER TABLE professor AUTO_INCREMENT = 2401");

            String encryptedPassword = passwordEncoder.encode("1234");

            // List of SQL statements
            List<String> sqlStatements = new ArrayList<>();

            //professor
            sqlStatements.add("INSERT INTO professor(name, birth, tel, gender, address, id_user) VALUES ('김교수02', '19950320', '010-1234-1234', 'F', '고양시', '2')");
            sqlStatements.add("INSERT INTO professor(name, birth, tel, gender, address, id_user) VALUES ('박교수03', '19931231', '010-9876-5432', 'M', '서울시', '3')");
            sqlStatements.add("INSERT INTO professor(name, birth, tel, gender, address, id_user) VALUES ('최교수07', '19931231', '010-9876-5432', 'M', '인천광역시', '7')");
            sqlStatements.add("INSERT INTO admin(name, birth, tel, gender, address, id_user) VALUES ('관리자01', '19990101', '010-1000-2000', 'M', '서울시', '4')");

            // student
            sqlStatements.add("INSERT INTO student(name, birth, tel, gender, address, id_user) VALUES ('김학생', '20020202', '010-2222-3333', 'M', '서울시 마포구', '1')");
            sqlStatements.add("INSERT INTO student(name, birth, tel, gender, address, id_user) VALUES ('홍지현', '19000130', '010-9685-6060', 'F', '서울시 송파구', '5')");
            sqlStatements.add("INSERT INTO student(name, birth, tel, gender, address, id_user) VALUES ('손재웅', '196001231', '010-7410-3539', 'M', '서울시 서초구', '6')");
            sqlStatements.add("INSERT INTO student(name, birth, tel, gender, address, id_user) VALUES ('설한길', '19960706', '010-1212-2323', 'M', '화성시', '8')");
            sqlStatements.add("INSERT INTO student(name, birth, tel, gender, address, id_user) VALUES ('윤바다', '19970325', '010-3434-4545', 'F', '서귀포시', '9')");
            sqlStatements.add("INSERT INTO student(name, birth, tel, gender, address, id_user) VALUES ('박병헌', '19991012', '010-2422-7878', 'M', '부산시', '10')");
            sqlStatements.add("INSERT INTO student(name, birth, tel, gender, address, id_user) VALUES ('임은채', '19890112', '010-5454-5656', 'F', '전주시', '11')");
            sqlStatements.add("INSERT INTO student(name, birth, tel, gender, address, id_user) VALUES ('안미래', '19910228', '010-9898-0505', 'F', '대전광역시', '12')");
            sqlStatements.add("INSERT INTO student(name, birth, tel, gender, address, id_user) VALUES ('오강민', '19920505', '010-5353-7878', 'M', '세종시', '13')");
            sqlStatements.add("INSERT INTO student(name, birth, tel, gender, address, id_user) VALUES ('하경택', '19930623', '010-6868-5757', 'M', '강원도', '14')");

            //user
            sqlStatements.add("INSERT INTO user(id_user, login_id, password, regist_date, email, role) VALUES(1, 'stu', '" + encryptedPassword + "', '2024-05-17', 'kim@email.com', 'stu')");
            sqlStatements.add("INSERT INTO user(id_user, login_id, password, regist_date, email, role) VALUES(2, 'prof', '" + encryptedPassword + "', '2024-05-19', 'kimprof@email.com', 'prof')");
            sqlStatements.add("INSERT INTO user(id_user, login_id, password, regist_date, email, role) VALUES(3, 'prof2', '" + encryptedPassword + "', '2024-05-23', 'parkprof@email.com', 'prof')");
            sqlStatements.add("INSERT INTO user(id_user, login_id, password, regist_date, email, role) VALUES(4, 'admin', '" + encryptedPassword + "', '2024-05-18', 'admin@email.com', 'admin')");
            sqlStatements.add("INSERT INTO user(id_user, login_id, password, regist_date, email, role) VALUES(5, 'stu2', '" + encryptedPassword + "', '2024-05-22', 'hong@email.com', 'stu')");
            sqlStatements.add("INSERT INTO user(id_user, login_id, password, regist_date, email, role) VALUES(6, 'stu3', '" + encryptedPassword + "', '2024-05-22', 'sSon@email.com', 'stu')");
            sqlStatements.add("INSERT INTO user(id_user, login_id, password, regist_date, email, role) VALUES(7, 'prof3', '" + encryptedPassword + "', '2024-05-27', 'choi@email.com', 'prof')");
            sqlStatements.add("INSERT INTO user(id_user, login_id, password, regist_date, email, role) VALUES(8, 'stu9', '" + encryptedPassword + "', '2024-05-22', 'SHK@email.com', 'stu')");
            sqlStatements.add("INSERT INTO user(id_user, login_id, password, regist_date, email, role) VALUES(9, 'stu10', '" + encryptedPassword + "', '2024-05-22', 'yoonbada@email.com', 'stu')");
            sqlStatements.add("INSERT INTO user(id_user, login_id, password, regist_date, email, role) VALUES(10, 'stu4', '" + encryptedPassword + "', '2024-05-22', 'BBH123@email.com', 'stu')");
            sqlStatements.add("INSERT INTO user(id_user, login_id, password, regist_date, email, role) VALUES(11, 'stu5', '" + encryptedPassword + "', '2024-05-22', 'Lim@email.com', 'stu')");
            sqlStatements.add("INSERT INTO user(id_user, login_id, password, regist_date, email, role) VALUES(12, 'stu6', '" + encryptedPassword + "', '2024-05-22', 'NoFuture@email.com', 'stu')");
            sqlStatements.add("INSERT INTO user(id_user, login_id, password, regist_date, email, role) VALUES(13, 'stu7', '" + encryptedPassword + "', '2024-05-22', 'OKang@email.com', 'stu')");
            sqlStatements.add("INSERT INTO user(id_user, login_id, password, regist_date, email, role) VALUES(14, 'stu8', '" + encryptedPassword + "', '2024-05-22', 'hahaha@email.com', 'stu')");

            //program
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (2,'통관 및 관세 실무 이해','2024-03-01', '2024-03-21', '2024-02-15', '2024-02-28','통관 및 관세에 관심이 있는 재직자',1,'온라인',10,7,'무료','월,화,수','09:00~11:00',2402)");
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (1,'자유무역협정(FTA) 실무','2024-04-01', '2024-04-14', '2024-03-15', '2024-03-31','자유무역에 관심이 있는 성인',7,'오프라인',30,8,'무료','수,목,금','13:00~18:00',2401)");
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (3,'검색 엔진 최적화(SEO) 원리','2024-05-01', '2024-05-21', '2024-04-15', '2024-04-30','SEO를 통한 마케팅에 관심있는 전공자',2,'오프라인',30,10,'무료','월,화,수,목,금','09:00~18:00',2403)");
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (4, '공급망 관리의 기본 원리', '2024-06-01','2024-08-31','2024-04-15', '2024-04-30', '공급망 관리에 관심 있는 전공자', 3, '오프라인', 10, 7, '무료', '월,수,금', '10:00~12:00', 2401)");
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (5, '노사 관계와 협상 기술', '2024-06-02','2024-08-31','2024-04-15', '2024-04-30', '노사 관계에 관심이 있는 직장인', 4, '오프라인', 20, 7, '무료', '화,목', '14:00~16:00', 2402)");
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (6, '환경과 생태학', '2024-06-03', '2024-06-08', '2024-04-15', '2024-04-30', '환경에 관심이 있는 누구나', 5, '오프라인', 10, 7, '무료', '월,수,금', '09:00~11:00', 2403)");
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (1, '무역장벽과 비관세장벽', '2024-06-04', '2024-06-10', '2024-04-15', '2024-04-30', '무역 관련 직종자', 6, '오프라인', 25, 7, '무료', '화,목', '13:00~15:00', 2401)");
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (2, '수출입 절차와 문서 작성', '2024-06-05', '2024-06-11', '2024-04-15', '2024-04-30', '수출입 업무 관련 직종자', 7, '오프라인', 20, 7, '무료', '월,수,금', '10:00~12:00', 2402)");
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (3, '데이터 분석과 마케팅', '2024-06-06', '2024-06-08', '2024-05-15', '2024-06-30', '데이터 분석 입문자', 1, '온라인', 30, 7, '무료', '화,목', '14:00~16:00', 2403)");
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (4, '지속 가능한 공급망 관리', '2024-06-07', '2024-06-10', '2024-05-15', '2024-06-30', '공급망 관리에 관심이 있는 성인', 2, '오프라인', 15, 0, '무료', '월,수,금', '10:00~12:00', 2401)");
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (5, '성과 평가와 보상 체계','2024-06-08', '2024-06-20', '2024-05-15', '2024-07-30', '인사 관리자', 3, '오프라인', 20, 0, '무료', '화,목', '14:00~16:00', 2402)");
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (3, '예술과 문화의 이해', '2024-06-09', '2024-06-11', '2024-05-15', '2024-07-30', '누구나', 4, '오프라인', 15, 0, '무료', '월,수,금', '09:00~11:00', 2403)");
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (1, '국제통상의 주요 사례 연구', '2024-06-10', '2024-06-30', '2024-05-15', '2024-07-30', '통상에 관심이 있는 누구나', 5, '오프라인', 20, 0, '무료', '화,목', '14:00~16:00', 2401)");
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (2, '무역 보험과 리스크 관리', '2024-06-11', '2024-06-22', '2024-05-15', '2024-07-30', '무역 보험에 관심이 있는 사람', 6, '오프라인', 25, 0, '무료', '화,목', '13:00~15:00', 2402)");
            sqlStatements.add("INSERT INTO program (id_cate, pgm_name, st_dt, end_dt, sugang_st_dt, sugang_end_dt, pgm_target, id_room, pgm_method, pgm_per, num_of_stu, pgm_fee, pgm_day, pgm_time, id_prof) VALUES (3, '전자 무역의 기술 혁신','2024-06-12', '2024-06-27', '2024-05-15', '2024-07-30', '관심이 있는 사람', 7, '오프라인', 20, 7, '무료', '월,수,금', '10:00~12:00', 3)");

            //syllabus
            sqlStatements.add("INSERT INTO syllabus (id_pgm, course_overview, objective, teaching, book, evaluation, remarks, id_prof) VALUES (1,'이 강좌는 통관 및 관세 실무의 기본 원리를 다룹니다. 통관 절차와 관세의 이론적 배경을 이해하고 실제 적용 사례를 학습합니다.', '학생들이 통관 및 관세의 기본 원리를 이해하고, 이를 실제 무역 업무에 적용할 수 있도록 하는 것이 목표입니다.', '오프라인', '통관 및 관세 실무 이해 (저자: Shoot Goalkeeper, lance 출판사)', '수료기준 출석률 80% 이상, 과제 100%', '없음', 2402)");
            sqlStatements.add("INSERT INTO syllabus (id_pgm, course_overview, objective, teaching, book, evaluation, remarks, id_prof) VALUES (2,'이 강좌는 자유무역협정(FTA) 실무의 기본 원리를 다룹니다. 자유무역협정의 이론적 배경과 실제 적용 사례를 학습합니다.', '학생들이 자유무역협정의 기본 원리를 이해하고, 이를 실제 무역 업무에 적용할 수 있도록 하는 것이 목표입니다.', '오프라인', '쉽게 배우는 자유무역협정 (저자: Trading God, miracle 출판사)', '수료기준 출석률 80% 이상, 과제 100%', '출석 빠지지 마세요.', 2401)");
            sqlStatements.add("INSERT INTO syllabus (id_pgm, course_overview, objective, teaching, book, evaluation, remarks, id_prof) VALUES (3,'이 강좌는 검색 엔진 최적화(SEO)의 기본 원리를 다룹니다. 현대의 디지털 마케팅에서 SEO가 어떻게 작동하는지 이해하고, 웹사이트의 가시성을 높이는 방법을 학습합니다.', '학생들이 SEO의 기본 원리를 이해하고, 이를 실제 웹사이트에 적용하여 검색 엔진에서의 가시성을 향상시키는 것이 목표입니다.', '오프라인', '검색 엔진 최적화의 비밀 (저자: Mr. BigData, GPT 출판사)', '수료기준 출석률 80% 이상, 과제 100%', '과제는 온라인으로 제출합니다.', 2403)");
            sqlStatements.add("INSERT INTO syllabus (id_pgm, course_overview, objective, teaching, book, evaluation, remarks, id_prof) VALUES (4,'이 강좌는 공급망 관리의 기본 원리를 다룹니다. 현대의 글로벌 공급망에서 발생하는 주요 이슈와 문제들을 이해하고 해결하는 방법을 학습합니다.', '학생들이 공급망 관리의 기본 원리를 이해하고, 이를 실제 비즈니스 상황에 적용할 수 있도록 하는 것이 목표입니다.', '오프라인', '공급망 관리의 원리와 실제 (저자: supply depot, Terran 출판사)', '수료기준 출석률 80% 이상, 과제 100%', '과제 제출 기한을 엄수하세요.', 2401)");

            //schedule
            sqlStatements.add("INSERT INTO schedule (sched_no, id_pgm, day_sched, learning_contents, learning_detail, note) VALUES (1, 1, '2024-03-01', '관세선의 개념에 대해 이해한다.', '대면수업', '오티랑 함께 진행합니다~~!')");

            //classroom
            sqlStatements.add("INSERT INTO class_room VALUES (1,'온라인 학습 관리 시스템(LMS)')");
            sqlStatements.add("INSERT INTO class_room VALUES (2,'이대캠퍼스 301호')");
            sqlStatements.add("INSERT INTO class_room VALUES (3,'이대캠퍼스 302호')");
            sqlStatements.add("INSERT INTO class_room VALUES (4,'이대캠퍼스 601호')");
            sqlStatements.add("INSERT INTO class_room VALUES (5,'이대캠퍼스 302호')");
            sqlStatements.add("INSERT INTO class_room VALUES (6,'강남캠퍼스 201호')");
            sqlStatements.add("INSERT INTO class_room VALUES (7,'강남캠퍼스 202호')");


            //category
            sqlStatements.add("INSERT INTO category VALUES (1,'국제통상정책')");
            sqlStatements.add("INSERT INTO category VALUES (2,'무역거래실무')");
            sqlStatements.add("INSERT INTO category VALUES (3,'디지털마케팅')");
            sqlStatements.add("INSERT INTO category VALUES (4,'공급망관리(SCM)')");
            sqlStatements.add("INSERT INTO category VALUES (5,'인적자원관리')");
            sqlStatements.add("INSERT INTO category VALUES (6,'일반교양')");

            //exam
            sqlStatements.add("INSERT INTO exam(name, start_date, end_date, status, count, description, id_program, id_prof) VALUES ('통관관세 시험', '2024-05-10', '2024-05-24', '진행중', '0', '수업 내용을 요약해서 레포트로 제출할 것.','1','2402')");
            sqlStatements.add("INSERT INTO exam(name, start_date, end_date, status, count, description, id_program, id_prof) VALUES ('자유무역협정 시험', '2024-05-10', '2024-05-24', '진행중', '5', '수업 시간에 배운걸 다 써서 내세요.','2','2401')");
            sqlStatements.add("INSERT INTO exam(name, start_date, end_date, status, count, description, id_program, id_prof) VALUES ('SEO 시험', '2024-05-10', '2024-05-24', '진행중', '0', 'SEO란 무엇인가? 500자 이내로 레포트 제출.','3','2403')");

            //exam_summit
            sqlStatements.add("INSERT INTO exam_submission(id_program, id_exam, id_student, id_file, submit_time, exam_status) VALUES (2, 2, 2024005, 1, '2024-05-23 13:05:29','제출 완료')");
            sqlStatements.add("INSERT INTO exam_submission(id_program, id_exam, id_student, id_file, submit_time, exam_status) VALUES (2, 2, 2024006, 2, '2024-05-24 20:47:01','제출 완료')");
            sqlStatements.add("INSERT INTO exam_submission(id_program, id_exam, id_student, id_file, submit_time, exam_status) VALUES (2, 2, 2024008, 3, '2024-05-20 17:10:45','제출 완료')");
            sqlStatements.add("INSERT INTO exam_submission(id_program, id_exam, id_student, id_file, submit_time, exam_status) VALUES (2, 2, 2024009, 4, '2024-05-24 23:59:59','제출 완료')");
            sqlStatements.add("INSERT INTO exam_submission(id_program, id_exam, id_student, id_file, submit_time, exam_status) VALUES (2, 2, 2024010, 5, '2024-05-22 21:13:22','제출 완료')");

            //file
            sqlStatements.add("INSERT INTO file(file_name, file_type, id_exam, id_student) VALUES ('homework.txt','txt', 2, 2024005)");
            sqlStatements.add("INSERT INTO file(file_name, file_type, id_exam, id_student) VALUES ('final_homework.txt','txt', 2, 2024006)");
            sqlStatements.add("INSERT INTO file(file_name, file_type, id_exam, id_student) VALUES ('안미래.txt','txt', 2, 2024008)");
            sqlStatements.add("INSERT INTO file(file_name, file_type, id_exam, id_student) VALUES ('오강민 과제.txt','txt', 2, 2024009)");
            sqlStatements.add("INSERT INTO file(file_name, file_type, id_exam, id_student) VALUES ('과제제출.txt','txt', 2, 2024010)");

            //sugang
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024001,3,3,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024001,1,2,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024002,3,3,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024003,3,3,'2024-05-22 12:47:53','신청 완료',1)");

            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024004,2,1,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024004,1,2,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024004,3,3,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024004,4,4,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024004,5,5,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024004,6,6,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024004,1,7,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024004,2,8,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024004,3,9,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024004,3,15,'2024-05-22 12:47:53','신청 완료',1)");

            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024005,2,1,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024005,1,2,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024005,3,3,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024005,4,4,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024005,5,5,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024005,6,6,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024005,1,7,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024005,2,8,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024005,3,9,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024005,3,15,'2024-05-22 12:47:53','신청 완료',1)");

            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024006,2,1,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024006,1,2,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024006,3,3,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024006,4,4,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024006,5,5,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024006,6,6,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024006,1,7,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024006,2,8,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024006,3,9,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024006,3,15,'2024-05-22 12:47:53','신청 완료',1)");

            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024007,2,1,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024007,1,2,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024007,3,3,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024007,4,4,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024007,5,5,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024007,6,6,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024007,1,7,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024007,2,8,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024007,3,9,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024007,3,15,'2024-05-22 12:47:53','신청 완료',1)");

            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024008,2,1,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024008,1,2,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024008,3,3,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024008,4,4,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024008,5,5,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024008,6,6,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024008,1,7,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024008,2,8,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024008,3,9,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024008,3,15,'2024-05-22 12:47:53','신청 완료',1)");

            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024009,2,1,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024009,1,2,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024009,3,3,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024009,4,4,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024009,5,5,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024009,6,6,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024009,1,7,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024009,2,8,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024009,3,9,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024009,3,15,'2024-05-22 12:47:53','신청 완료',1)");

            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024010,2,1,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024010,1,2,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024010,3,3,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024010,4,4,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024010,5,5,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024010,6,6,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024010,1,7,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024010,2,8,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024010,3,9,'2024-05-22 12:47:53','신청 완료',1)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024010,3,15,'2024-05-22 12:47:53','신청 완료',1)");

            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024007,3,14,'2024-05-23 15:31:38','신청중',0)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024008,3,14,'2024-05-23 15:31:39','신청중',0)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024009,3,14,'2024-05-23 15:31:40','신청중',0)");
            sqlStatements.add("INSERT INTO sugang(id_student, id_cate, id_pgm, st_dt, status,course_status) VALUES (2024010,3,14,'2024-05-23 15:31:41','신청중',0)");

            //attendance
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (3, 2024001, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (2, 2024001, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (3, 2024002, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (3, 2024003, 0,0,0,-1)");

            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (1, 2024004, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (2, 2024004, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (3, 2024004, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (4, 2024004, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (5, 2024004, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (6, 2024004, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (7, 2024004, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (8, 2024004, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (9, 2024004, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (15, 2024004, 0,0,0,-1)");

            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (2, 2024005, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (1, 2024005, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (3, 2024005, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (4, 2024005, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (5, 2024005, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (6, 2024005, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (7, 2024005, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (8, 2024005, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (9, 2024005, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (15, 2024005, 0,0,0,-1)");

            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (1, 2024006, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (2, 2024006, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (3, 2024006, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (4, 2024006, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (5, 2024006, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (6, 2024006, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (7, 2024006, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (8, 2024006, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (15, 2024006, 0,0,0,-1)");

            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (1, 2024007, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (2, 2024007, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (3, 2024007, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (4, 2024007, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (5, 2024007, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (6, 2024007, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (7, 2024007, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (8, 2024007, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (9, 2024007, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (15, 2024007, 0,0,0,-1)");

            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (1, 2024008, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (2, 2024008, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (3, 2024008, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (4, 2024008, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (5, 2024008, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (6, 2024008, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (7, 2024008, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (8, 2024008, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (9, 2024008, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (15, 2024008, 0,0,0,-1)");

            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (1, 2024009, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (2, 2024009, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (3, 2024009, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (4, 2024009, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (5, 2024009, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (6, 2024009, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (7, 2024009, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (8, 2024009, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (9, 2024009, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (15, 2024009, 0,0,0,-1)");

            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (1, 2024010, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (2, 2024010, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (3, 2024010, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (4, 2024010, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (5, 2024010, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (6, 2024010, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (7, 2024010, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (8, 2024010, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (9, 2024010, 0,0,0,-1)");
            sqlStatements.add("INSERT INTO attendance (id_pgm, id_student, att_stat, late_stat, abs_stat, exam_score) VALUES (15, 2024010, 0,0,0,-1)");

            //notice
            sqlStatements.add("INSERT INTO notice(title, content, created_date, views) VALUES ('[마감]4050을 위한 빅데이터 전문가 양성과정','●과정명 : 4050을 위한 빅데이터 전문가 양성과정\n" +
                    "●교육기간 : 2024.04.01.(화)~2024.04.26.(화)\n" +
                    "*4/9(수), 4/15(화)은 휴강예정*\n" +
                    "●교육일시 : 매주 화,수 9:00~12:00(주2회 3시간 수업, 총 45시간)\n" +
                    "●수강료 : 50,000원(출석 80% 이상 이수시, 수강료 60% 환급)\n" +
                    "●교육장소 : 국제무역아카데미 1층 평생교육실습실\n" +
                    "●접수방법 \n" +
                    "-온라인접수 : 국제무역아카데미 홈페이지 > 수강신청 \n" +
                    "-방문접수 : 국제무역아카데미 1층 교육센터(9시부터 16시까지 방문 가능하십니다.)','2024-03-26 16:42:26',0)");
            sqlStatements.add("INSERT INTO notice(title, content, created_date, views) VALUES ('[통관 및 관세 실무 이해] 개강일자 변경 안내','통관 및 관세 실무 이해 1차 강의가 본교 사정으로 인하여 개강일자가 변경 됩니다.\n" +
                    "\n" +
                    "일정에 참고하시기 바랍니다\n" +
                    "\n" +
                    " \n" +
                    "\n" +
                    "- 교육일정: 5월25일(토) ~ 7월 14일(일)\n" +
                    "\n" +
                    "- 접수일정: 4월22일(월) ~ 5월 3일(금)','2024-05-02 15:30:00',0)");
            sqlStatements.add("INSERT INTO notice(title, content, created_date, views) VALUES ('[검색 엔진 최적화(SEO) 원리] 프로그램 개설 안내', '[디지털마케팅] 검색 엔진 최적화(SEO) 원리 프로그램 안내\n" +
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
                    " - 국제무역아카데미 T.000-123-1234~5,5678\n" +
                    "\n" +
                    " - 최박사 교수 T.010-7777-0000', '2024-05-03 09:32:33', 0)");

            sqlStatements.add("INSERT INTO notice(title, content, created_date, views) VALUES ('[자유무역협정(FTA) 실무] 교육생 모집', '2024 자유무역협정(FTA) 실무 교육생 모집\n" +
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
            sqlStatements.add("INSERT INTO notice(title, content, created_date, views) VALUES ('디지털 마케팅 혁신 특강 모집 안내', '평생교육사업팀에서 『디지털 마케팅 혁신이 가져오는 시대 선도』 특강을 진행하오니 많은 참여 바랍니다.\n" +
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

            // Execute all SQL statements in a batch
            jdbcTemplate.batchUpdate(sqlStatements.toArray(new String[0]));
        }
    }
}




