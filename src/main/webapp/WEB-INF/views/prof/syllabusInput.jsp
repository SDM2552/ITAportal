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
        .classForm {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            gap: 15px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .classForm div {
            display: flex;
            flex-direction: column;
        }

        .classForm label {
            font-weight: bold;
            margin-bottom: 5px;
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
                            <td><div id="category">${programInfo.cateName}</div></td>
                            <th><label for="pgmName">교과목명<br>(Program Title)</label></th>
                            <td><div id="pgmName">${programInfo.pgmName}</div></td>
                        </tr>
                        <tr>
                            <th><label for="classRoom">수업시간/강의실<br>(Class Time/Class Room)</label></th>
                            <td><div id="classRoom">${programInfo.roomName}</div></td>
                            <th><label for="programDuration">강의기간<br>(Program Duration)</label></th>
                            <td><div id="programDuration">${programInfo.stDt}~${programInfo.endDt}</div></td>
                        </tr>
                        </tbody>
                    </table>

            <button onclick="scheduleInput()">주차별 강의계획 입력</button>
                <!-- 강의 정보 입력 폼 -->

                    <div class="classForm">
                        <div>
                            <label for="lectureName">강의명:</label>
                            <input type="text" id="lectureName" value="${programInfo.pgmName}" readonly>
                        </div>
                        <div>
                            <label for="teaching">강의방식</label>
                            <select id="teaching">
                                <option value="online">온라인</option>
                                <option value="offline">오프라인</option>
                            </select>
                        </div>
                        <div>
                            <label for="book">교재 및 참고 자료:</label>
                            <input type="text" id="book" placeholder="교재 및 참고 자료 입력" value="${syllabus.book}">
                        </div>
                        <div>
                            <label for="courseOverview">교과목 개요:</label>
                            <textarea id="courseOverview" rows="5" placeholder="강의 개요 입력" >${syllabus.courseOverview}</textarea>
                        </div>
                        <div>
                            <label for="objective">수업 목표:</label>
                            <textarea id="objective" rows="3" placeholder="수업 목표 입력" >${syllabus.objective}</textarea>
                        </div>
                        <div>
                            <label for="evaluation">평가 방법:</label>
                            <textarea id="evaluation" rows="3" placeholder="평가 방법 입력" >${syllabus.evaluation}</textarea>
                        </div>
                        <div>
                            <label for="remarks">비고</label>
                            <textarea id="remarks" rows="3" placeholder="기타 메모사항 입력" >${syllabus.remarks}</textarea>
                        </div>
                        <input type="hidden" id="idProf" value="${syllabus.idProf}">
                        <input type="hidden" id="idPgm" value="${programInfo.idPgm}">
                        <button onclick="save()">저장</button>
                    </div>




            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>

<script>
    function save(){
        const idPgm = document.querySelector('.classForm input#idPgm').value;
        const courseOverview = document.querySelector('.classForm textarea#courseOverview').value;
        const objective = document.querySelector('.classForm textarea#objective').value;
        const teaching = document.querySelector('.classForm select#teaching').value;
        const book = document.querySelector('.classForm input#book').value;
        const evaluation = document.querySelector('.classForm textarea#evaluation').value;
        const remarks = document.querySelector('.classForm textarea#remarks').value;
        const idProf = document.querySelector('.classForm input#idProf').value;

        const params = {
            idPgm : idPgm,
            courseOverview : courseOverview,
            objective : objective,
            teaching : teaching,
            book : book,
            evaluation : evaluation,
            remarks : remarks,
            idProf : idProf,
        }

        console.log(params);

        $.ajax({
            url : `/prof/syllabus/input`,
            type : 'post',
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            data : JSON.stringify(params),
            async : false,
            success : function (response) {
                alert('입력되었습니다.')
            },
            error : function (request, status, error) {
                console.log(error)
            }
        });
    }

    function scheduleInput(){
            const idPgm = document.querySelector('.classForm input#idPgm').value;
            window.location.href = '/prof/schedule?idPgm=' + idPgm; // 프로그램 ID를 가지고 페이지 이동
    }
</script>
</body>

</html>