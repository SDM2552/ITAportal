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
                        <col width="5%">
                        <col width="5%">
                        <col width="*%">
                        <col width="10%">
                        <col width="15%%">
                    </colgroup>
                    <thead>
                        <th scope="col">수업주차</th>
                        <th scope="col">수업일자</th>
                        <th scope="col">시작시간</th>
                        <th scope="col">종료시간</th>
                        <th scope="col">수업내용</th>
                        <th scope="col">수업방법</th>
                        <th scope="col">비고</th>
                    </thead>

                    <tbody>
                    <c:forEach var="schedules" items="${schedules}" >
                    <tr>
                        <td>
                            <span><select id="idSched" name="idShced">
                                    <c:forEach var="i" begin="1" end="${maxIdSched}">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                            </select></span>
                        </td>
                        <td>
                            <span><input type="date" id="daySched" value="${programInfo.stDt}" min="${programInfo.stDt}" max="${programInfo.endDt}"></span>
                        </td>
                        <td>
                            <span><input type="time" id="startSched" value="${schedules.startSched}" min="06:00:00" max="19:00:00"></span>
                        </td>
                        <td>
                            <span><input type="time" id="endSched" value="${schedules.endSched}" min="07:00:00" max="20:00:00"></span>
                        </td>
                        <td>
                            <span><textarea id="learningContents" rows="3" placeholder="수업 내용" >${schedules.learningContents}</textarea></span>
                        </td>
                        <td>
                            <span><input type="text" id="learningDetail" placeholder="학습 방법" value="${schedules.learningDetail}"></span>
                        </td>
                        <td>
                            <textarea id="note" rows="3" placeholder="기타 메모사항 입력" >${schedules.note}</textarea>
                        </td>
                        <input type="hidden" id="idProf" value="${syllabus.idProf}">
                        <input type="hidden" id="idPgm" value="${programInfo.idPgm}">

                    </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <button onclick="add()">추가</button>
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
    function add(){
        const lastRow = document.querySelector("#schedule tbody tr:last-child");
        const lastDate = new Date(lastRow.querySelector("#daySched").value);
        const newDate = new Date(lastDate.getTime() + (7 * 24 * 60 * 60 * 1000)); // 현재 날짜에 7일을 더함
        const formattedDate = newDate.toISOString().split('T')[0]; // 날짜 형식을 YYYY-MM-DD로 변환

        const newRow = document.createElement("tr");
        const newRowHTML = `
    <td>
        <span><select id="idSched" name="idShced">
           <c:forEach var="i" begin="1" end="${weeks}">
              <option value="${i}">${i}</option>
           </c:forEach>
        </select></span>
    </td>
    <td>
        <span><input type="date" id="daySched" value="${formattedDate}" min="${formattedDate}" max="${programInfo.endDt}"></span>
    </td>
    <td>
        <span><input type="time" id="startSched" value="09:00:00" min="06:00:00" max="19:00:00"></span>
    </td>
    <td>
        <span><input type="time" id="endSched" value="10:00:00" min="07:00:00" max="20:00:00"></span>
    </td>
    <td>
        <span><textarea id="learningContents" rows="3" placeholder="수업 내용"></textarea></span>
    </td>
    <td>
        <span><input type="text" id="learningDetail" placeholder="학습 방법" value=""></span>
    </td>
    <td>
        <textarea id="note" rows="3" placeholder="기타 메모사항 입력"></textarea>
    </td>
    <input type="hidden" id="idPgm" value="${programInfo.idPgm}">
    `;
        newRow.innerHTML = newRowHTML;
        document.getElementById("schedule").getElementsByTagName("tbody")[0].appendChild(newRow);
    }

    function save(){

        const schedules = [];

        document.querySelectorAll("#schedule tbody tr").forEach(row => {
            const idSched = parseInt(row.querySelector("#idSched").value);
            const idPgm = document.querySelector('.classForm input#idPgm').value;
            const daySched = row.querySelector("#daySched").value;
            const startSched = row.querySelector("#startSched").value;
            const endSched = row.querySelector("#endSched").value;
            const learningContents = row.querySelector("#learningContents").value;
            const learningDetail = row.querySelector("#learningDetail").value;
            const note = row.querySelector("#note").value;

            schedules.push({
                idSched: idSched,
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