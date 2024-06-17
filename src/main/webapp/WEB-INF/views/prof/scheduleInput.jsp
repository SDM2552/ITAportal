<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .tblData textarea {
            border: none;
            resize: none;
            display: block;
            padding: 0;
            margin: 0;
            outline: none;
        }
        .tblData td {
            padding: 0;
            align-items: center;
        }
    </style>
    <title>강의계획서 - 주차별 계획 입력</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="/WEB-INF/views/layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="/WEB-INF/views/layout/nav_prof_program.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
                <span>강의 관리 <i class="fa-solid fa-angle-right"></i> </span><span>${programInfo.pgmName} <i class="fa-solid fa-angle-right"></i> </span>
                <span class="on"> 주차별 계획 입력</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit">주차별 계획 입력</h3>

            <!-- 본문 -->
            <h4 class="subTit">강의 정보</h4>
            <!-- 강의 정보 테이블 -->
            <table class="tblData mt10">
                <colgroup>
                    <col style="width: 20%;">
                    <col style="width: 30%;">
                    <col style="width: 20%;">
                    <col style="width: 30%;">
                </colgroup>

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
                    <td><div id="programDuration">${programInfo.stDt} ~ ${programInfo.endDt}</div></td>
                </tr>
                </tbody>
            </table><br>

            <button class="s1" onclick="syllabusInput()">강의계획서 입력</button>

                <!-- 강의 정보 입력 폼 -->
            <div class="schedule tblData mt10" id="schedule">
            <table>
                    <colgroup>
                        <col width="10%">
                        <col width="15%">
                        <col width="15%">
                        <col width="25%">
                        <col width="25%">
                        <col width="20%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">수업주차</th>
                        <th scope="col">수업일자</th>
                        <th scope="col">수업시간</th>
                        <th scope="col">수업내용</th>
                        <th scope="col">수업방법</th>
                        <th scope="col">비고</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="i" begin="1" end="${maxIdSched}">
                        <tr>
                            <td>
                                <span class="schedNo">${i}</span>
                            </td>
                            <td>
                                <span class="daySched">${schedules[i-1].daySched}</span>
                            </td>
                            <td>
                                <span class="pgmTime">${programInfo.pgmTime}</span>
                            </td>
                            <td>
                                <span><textarea class="learningContents" rows="3" placeholder="수업 내용 입력">${schedules[i-1].learningContents}</textarea></span>
                            </td>
                            <td>
                                <span><textarea class="learningDetail" rows="3" placeholder="수업 방법 입력">${schedules[i-1].learningDetail}</textarea></span>
                            </td>
                            <td>
                                <textarea class="note" rows="3" placeholder="기타 메모사항 입력">${schedules[i-1].note}</textarea>
                            </td>
                            <input type="hidden" class="idSched" value="${schedules[i-1].idSched}">
                            <input type="hidden" class="idPgm" value="${programInfo.idPgm}">
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="btnArea">
                <button type="button" class="btns btnSt01" onclick="save_onclick()" style="display: block; margin: 0 auto;">
                    <span>저장</span>
                </button>
            </div>


            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>

<script>
    function syllabusInput(){
        const idPgm = document.querySelector('input.idPgm').value;
        console.log(idPgm);
        window.location.href = '/prof/syllabus?idPgm=' + idPgm; // 프로그램 ID를 가지고 페이지 이동
    }

    function save_onclick(){
        if(!confirm("저장하시겠습니까?")) return;
        save();
    }

    function save(){

        const schedules = [];

        document.querySelectorAll("#schedule tbody tr").forEach(row => {
            const idSched = document.querySelector('input.idSched').value;
            const schedNo = parseInt(row.querySelector(".schedNo").innerText);
            const idPgm = document.querySelector('input.idPgm').value;
            const daySched = row.querySelector(".daySched").innerText;
            const pgmTime = row.querySelector(".pgmTime").innerText;
            const learningContents = row.querySelector(".learningContents").value;
            const learningDetail = row.querySelector(".learningDetail").value;
            const note = row.querySelector(".note").value;

            schedules.push({
                idSched: idSched,
                schedNo: schedNo,
                idPgm: idPgm,
                daySched: daySched,
                pgmTime: pgmTime,
                learningContents: learningContents,
                learningDetail: learningDetail,
                note: note
            });
        });

        console.log(schedules);

        $.ajax({
            url : `/prof/schedule/input`,
            type : 'post',
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            data : JSON.stringify(schedules),
            async : false,
            success : function (response) {
                alert('저장되었습니다.')
            },
            error : function (request, status, error) {
                console.log(error)
            }
        });

    }
</script>
</body>

</html>