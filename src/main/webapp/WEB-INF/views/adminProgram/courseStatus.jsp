<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>교육과정관리</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_program.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동></span>
                <span>강의관리></span>
                <span class="on">교육과정관리</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>교육과정관리</h3>

            <!-- 본문 -->

            <!-- 프로그램 목록 -->
            <div class="program">
                <h2>￭프로그램</h2>
                <table class="category-table">
                    <thead>
                    <tr>
                        <th>프로그램명</th>
                        <th>교육 시작일자</th>
                        <th>교육 종료일자</th>
                        <th>교육 대상</th>
                        <th>교육 방법</th>
                        <th>교육 인원</th>
                        <th>교육 비용</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="program" items="${prog}">
                        <tr>
                            <td>${program.pgmName}</td>
                            <td>${program.stDt}</td>
                            <td>${program.endDt}</td>
                            <td>${program.pgmTarget}</td>
                            <td>${program.pgmMethod}</td>
                            <td>${program.pgmPer}</td>
                            <td>${program.pgmFee}</td>
                            <td></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <a href="/progInput">
                    <button style="float: right;">추가예정</button>
                </a>
            </div>


            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp"/>
</div>
</body>

</html>