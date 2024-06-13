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
                <table id="schedule" >
                    <caption>

                    </caption>
                    <colgroup>
                        <col width="5%">
                        <col width="10%">
                        <col width="10%">
                        <col width="*%">
                        <col width="10%">
                        <col width="*%">
                    </colgroup>
                    <thead>
                        <th scope="col">수업주차</th>
                        <th scope="col">수업일자</th>
                        <th scope="col">수업시간</th>
                        <th scope="col">수업내용</th>
                        <th scope="col">수업방법</th>
                        <th scope="col">비고</th>
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
                                <span class="startSched">${programInfo.pgmTime}</span>
                            </td>
                            <td>
                                <span><textarea class="learningContents" rows="3" placeholder="수업 내용">${schedules[i-1].learningContents}</textarea></span>
                            </td>
                            <td>
                                <span><input type="text" class="learningDetail" placeholder="학습 방법" value="${schedules[i-1].learningDetail}"></span>
                            </td>
                            <td>
                                <textarea class="note" rows="3" placeholder="기타 메모사항 입력">${schedules[i-1].note}</textarea>
                            </td>
                            <input type="hidden" class="idProf" value="${syllabus.idProf}">
                            <input type="hidden" class="idPgm" value="${programInfo.idPgm}">
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <button onclick="save_onclick()">저장</button>
            </div>



            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>

<script>

    function save_onclick(){
        if(!confirm("저장하시겠습니까?")) return;
        save();
    }

    function save(){

        const schedules = [];

        document.querySelectorAll("#schedule tbody tr").forEach(row => {
            const schedNo = parseInt(row.querySelector(".schedNo").innerText);
            const idPgm = document.querySelector('input.idPgm').value;
            const daySched = row.querySelector(".daySched").value;
            const startSched = row.querySelector(".startSched").value;
            const endSched = row.querySelector(".endSched").value;
            const learningContents = row.querySelector(".learningContents").value;
            const learningDetail = row.querySelector(".learningDetail").value;
            const note = row.querySelector(".note").value;

            schedules.push({
                schedNo: schedNo,
                idPgm: idPgm,
                daySched: daySched,
                startSched: startSched,
                endSched: endSched,
                learningContents: learningContents,
                learningDetail: learningDetail,
                note: note
            })
        })

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