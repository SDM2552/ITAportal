<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>샘플 페이지</title>
    <style>
        div#contents.eduIntroCont {
            display: flex;
            flex-direction: column;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        form {
            margin-top: 20px;
            width: 100%;
            max-width: 600px; /* 조절 가능한 최대 너비 */
        }

        form div {
            margin-bottom: 15px;
        }

        form div label {
            margin-top: 20px;
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        form div input[type="text"],
        form div textarea,
        form div select {
            width: calc(100% - 10px); /* input 너비 조절 */
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 3px;
            box-sizing: border-box;
        }

        form div textarea {
            resize: vertical;
        }

        form button[type="submit"] {
            padding: 8px 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        form button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="/WEB-INF/views/layout/header_prof.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="/WEB-INF/views/layout/nav_student.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동</span>
                <span>수강 내역 조회</span>
                <span class="on">강의계획서 입력</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>강의계획서 입력</h3>

            <!-- 본문 -->
                <!-- 강의 정보 테이블 -->
                    <table>
                        <colgroup>
                            <col style="width: 20%;">
                            <col style="width: 30%;">
                            <col style="width: 20%;">
                            <col style="width: 30%;">
                        </colgroup>
                        <h2>강의 정보</h2>
                        <tbody>
                        <tr>
                            <th><label for="category">카테고리<br>(Category)</label></th>
                            <td><div id="category"></div></td>
                            <th><label for="pgmName">교과목명<br>(Program Title)</label></th>
                            <td><div id="pgmName"></div></td>
                        </tr>
                        <tr>
                            <th><label for="classRoom">수업시간/강의실<br>(Class Time/Class Room)</label></th>
                            <td><div id="classRoom"></div></td>
                            <th><label for="programDuration">강의기간<br>(Program Duration)</label></th>
                            <td><div id="programDuration"></div></td>
                        </tr>
                        </tbody>
                    </table>


                <!-- 강의 정보 입력 폼 -->

                    <form method="post" action="/prof/${idProf}/syllabus">
                        <div>
                            <label for="lectureName">강의명:</label>
                            <input type="text" id="lectureName" value="두둥탁" readonly>
                        </div>
                        <div>
                            <label for="teaching">강의방식</label>
                            <select id="teaching">
                                <option value="online">온라인</option>
                                <option value="offline">오프라인</option>
                            </select>
                        </div>
                        <div>
                            <label for="lectureTime">강의 시간:</label>
                            <input type="text" id="lectureTime" placeholder="강의 시간 입력">
                        </div>
                        <div>
                            <label for="book">교재 및 참고 자료:</label>
                            <input type="text" id="book" placeholder="교재 및 참고 자료 입력">
                        </div>
                        <div>
                            <label for="courseOverview">교과목 개요:</label>
                            <textarea id="courseOverview" rows="5" placeholder="강의 개요 입력"></textarea>
                        </div>
                        <div>
                            <label for="classObjective">수업 목표:</label>
                            <textarea id="classObjective" rows="3" placeholder="수업 목표 입력"></textarea>
                        </div>
                        <div>
                            <label for="evaluation">평가 방법:</label>
                            <textarea id="evaluation" rows="3" placeholder="평가 방법 입력"></textarea>
                        </div>
                        <div>
                            <label for="remarks">비고</label>
                            <textarea id="remarks" rows="3" placeholder="기타 메모사항 입력"></textarea>
                        </div>
                        <input type="hidden" id="idProf" value="#">
                        <button type="submit">저장</button>
                    </form>


            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>
</body>

</html>