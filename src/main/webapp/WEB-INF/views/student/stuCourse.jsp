<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>수강내역목록</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="layout/header.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="layout/nav_student.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동</span>
                <span>수강 내역 조회</span>
                <span class="on">수강 내역</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>마이페이지</h3>

            <!-- 본문 -->
            <c:forEach items="${enrollments}" var="enrollment">
                <tr>
                    <td>${enrollment.pgmName}</td>  <!-- EL 표현식 수정 -->
                    <td>${enrollment.stDt}</td>      <!-- EL 표현식 수정 -->
                    <td>${enrollment.status}</td>   <!-- EL 표현식 수정 -->
                </tr>
            </c:forEach>
            <!-- 본문 끝 -->

            <!-- //contents -->
        </div>

        <!-- footer -->
        <c:import url="layout/footer.jsp"/>
    </div>
</body>

</html>