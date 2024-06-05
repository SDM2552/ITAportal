<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>강의관리</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_prof_program.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span>강의 관리 <i class="fa-solid fa-angle-right"></i> </span><span>내 강의 목록 <i class="fa-solid fa-angle-right"></i> </span>
            <span>${ProgramDetail.pgmName} <i class="fa-solid fa-angle-right"></i></span><span class="on"> 출결 관리</span>
            <!-- //location -->

            <h3 class="pgTit">출결 관리</h3>

            <!-- 본문 -->
            <h4 class="subTit">프로그램 정보</h4>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="col">분류</th>
                        <td colspan="3">
                            ${ProgramDetail.cateName}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">프로그램명</th>
                        <td colspan="3">
                            ${ProgramDetail.pgmName}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">교육기간</th>
                        <td>
                            ${ProgramDetail.stDt} ~ ${ProgramDetail.endDt}
                        </td>
                        <th scope="col">강의 요일/시간</th>
                        <td>
                            ${ProgramDetail.pgmDay} / ${ProgramDetail.pgmTime}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">수강 인원</th>
                        <td>
                            ${ProgramDetail.numOfStu}/${ProgramDetail.pgmPer} 명
                        </td>
                        <th scope="col">교육 장소</th>
                        <td>
                            ${ProgramDetail.roomName}
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div><br>

            <div class="boxCnt02">
                <c:forEach var="attendance" items="${attendanceList}">
                <div class="boxInner">
                    <div class="wrap-info">
                        <div class="stu-port">
                            <img src="/image/port.png" alt="">
                        </div>
                        <div class="textinfo">
                            <p style="font-size: 17px;font-weight: bold">${attendance.studentName}</p>
                            <p>${attendance.userEmail}</p>
                            <div style="margin: 5px 0">
                            <button class="button_blkline" onclick="attendance(${attendance.idPgm}, ${attendance.idStudent})">출석</button>
                            <button class="button_blkline" onclick="lateStatus(${attendance.idPgm}, ${attendance.idStudent})">지각 </button>
                            <button  class="button_blkline" onclick="absenceStatus(${attendance.idPgm}, ${attendance.idStudent})">결석</button>
                            </div>
                            <p>지각횟수 : ${attendance.lateStatus} 회</p>
                            <p>결석횟수 : ${attendance.absenceStatus} 회</p>
                        </div>
                    </div>
                </div>
                </c:forEach>

            </div><br>

            <h4 class="subTit">전체 출결 현황</h4>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="15%">
                        <col width="15%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">성명</th>
                        <th scope="col">이메일</th>
                        <th scope="col">출석</th>
                        <th scope="col">지각</th>
                        <th scope="col">결석</th>
                        <th scope="col">출석률(%)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="attendance" items="${attendanceList}">
                        <tr>
                            <td>${attendance.studentName}</td>
                            <td>${attendance.userEmail}</td>
                            <td>${attendance.attendanceStatus}</td>
                            <td>${attendance.lateStatus}</td>
                            <td>${attendance.absenceStatus}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${attendance.attendanceStatus + attendance.lateStatus + attendance.absenceStatus == 0}">
                                        -
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="total" value="${attendance.attendanceStatus + attendance.lateStatus + attendance.absenceStatus}" />
                                        <c:set var="rate" value="${attendance.attendanceStatus * 100.0 / total}" />
                                        <fmt:formatNumber value="${rate}" type="number" maxFractionDigits="1" minFractionDigits="1" />%
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>


</body>
<script>
    function attendance(idPgm, idStudent) {
        if (confirm('출석 처리 하시겠습니까?')) {
            fetch('/prof/attendance', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    idPgm: idPgm,
                    idStudent: idStudent
                })
            })
                .then(response => response.text())
                .then(data => {
                    alert(data);
                    location.reload();
                })
                .catch(error => {
                    alert('출석 처리에 실패했습니다.');
                    console.error('Error:', error);
                });
        }
    }
    function lateStatus(idPgm, idStudent) {
        if (confirm('지각 처리 하시겠습니까?')) {
            fetch('/prof/lateStatus', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    idPgm: idPgm,
                    idStudent: idStudent
                })
            })
                .then(response => response.text())
                .then(data => {
                    alert(data);
                    location.reload();
                })
                .catch(error => {
                    alert('지각 처리에 실패했습니다.');
                    console.error('Error:', error);
                });
        }
    }
    function absenceStatus(idPgm, idStudent) {
        if (confirm('결석 처리 하시겠습니까?')) {
            fetch('/prof/absenceStatus', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    idPgm: idPgm,
                    idStudent: idStudent
                })
            })
                .then(response => response.text())
                .then(data => {
                    alert(data);
                    location.reload();
                })
                .catch(error => {
                    alert('결석 처리에 실패했습니다.');
                    console.error('Error:', error);
                });
        }
    }
</script>

</html>