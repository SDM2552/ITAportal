<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>수강 신청</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_sugang.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
                <span>수강 신청 </span>
            </div>
            <!-- //location -->

            <h3 class="pgTit">수강 신청</h3>

            <!-- 본문 -->
            <h1>수강 신청이 접수되었습니다.</h1><br>
            <ul style="font-size: 18px">
                <li>※ 신청하신 수강 확인은  <strong>수강 신청 <i class="fa-solid fa-angle-right"></i> 수강 내역 조회</strong> 에서 하시면 됩니다. </li>
                <li>※ 교육생 합격자 발표는 추후에 알려드립니다.</li>
            </ul><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp"/>
</div>

</body>

</html>