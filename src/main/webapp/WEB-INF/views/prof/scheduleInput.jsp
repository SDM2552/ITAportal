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
    <c:import url="/WEB-INF/views/layout/header.jsp" />

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

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>주차별 계획 입력</h3>

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


                <!-- 강의 정보 입력 폼 -->

                    <div class="classForm">
                        <div>
                            <label for="lectureName">강의명:</label>
                            <input type="text" id="lectureName" value="${programInfo.pgmName}" readonly>
                        </div>
                        <div>
                            <label for="daySched">수업일자</label>
                            <input type="text" id="daySched" placeholder="수업일자 입력(YYMMDD)" value="">
                        </div>
                        <div>
                            <label for="startSched">시작시간</label>
                            <input type="text" id="startSched" placeholder="수업시작시간(HH:MM)" value="">
                        </div>
                        <div>
                            <label for="endSched">종료시간</label>
                            <input type="text" id="endSched" placeholder="수업종료시간(HH:MM)" value="">
                        </div>
                        <div>
                            <label for="evaluation">학습내용</label>
                            <textarea id="evaluation" rows="3" placeholder="학습내용 입력" >${syllabus.evaluation}</textarea>
                        </div>
                        <div>
                            <label for="note">비고</label>
                            <textarea id="note" rows="3" placeholder="기타 메모사항 입력" >${syllabus.remarks}</textarea>
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


        const params = {

        }

        console.log(params);

        $.ajax({
            url : `/prof/schedule/input`,
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
</script>
</body>

</html>