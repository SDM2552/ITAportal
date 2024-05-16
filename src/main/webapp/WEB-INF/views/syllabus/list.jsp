<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>강의관리</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="/WEB-INF/views/layout/header_prof.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <!-- @@@@@@@@@@@@@@@@강사용으로 수정해야됨!@@@@@@@@@@@@@@@@@@@@ -->
        <c:import url="/WEB-INF/views/layout/nav_student.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동 </span>
                <span class="on">강의 관리</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>강의 관리</h3>

            <!-- 본문 -->
            <h2>내 강의 목록</h2>
            <table border="1">
                <colgroup>
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                    <col style="width: 45%;">
                    <col style="width: 30%;">
                </colgroup>
                <thead>
                <tr>
                    <th>선택</th>
                    <th>연번</th>
                    <th>프로그램 이름</th>
                    <th>강의기간</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="program" items="${pgms}" varStatus="loop">
                    <tr>
                        <td><input type="checkbox" name="selectedProgram" onclick="limitSelection(this)"></td>
                        <td>${loop.index + 1}</td>
                        <td>${program.pgmName}</td>
                        <td>${program.stDt}~${program.endDt}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div class="button-container">
                <button class="button" id="syllabusBtn" onclick="syllabus()" >강의계획서 작성</button>
                <button class="button" id="requestBtn" >휴보강 신청</button>
                <button class="button" id="attendanceBtn" >출석 관리</button>
                <button class="button" id="examBtn" >시험 관리</button>
            </div>

            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>


<script>
    //체크박스 중복되지 않도록함 (하나의 강의만 선택하도록)
    function limitSelection(checkbox) {
        var checkboxes = document.getElementsByName('selectedProgram');
        checkboxes.forEach(function (cb) {
            if (cb !== checkbox) {
                cb.checked = false;
            }
        });
    }
    //강의계획서 입력 페이지 이동 @김봄이
    function syllabus(){
        var selectedProgram = document.querySelector('input[name="selectedProgram"]:checked');
        if (selectedProgram) {
            var idPgm = selectedProgram.parentNode.nextElementSibling.textContent; // 수업 ID를 가져옴
            window.location.href = '/prof/syllabus?idPgm=' + idPgm; // 프로그램 ID를 가지고 페이지 이동
        } else {
            alert('수업을 선택하세요.');
        }
    }

</script>
</body>

</html>