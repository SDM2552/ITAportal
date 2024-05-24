
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="css/common.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <title>회원가입 성공!</title>
    </head>
    <body>
    <div class="wrap">
        <!-- header -->
        <c:import url="/WEB-INF/views/layout/header.jsp" />
        <!-- container -->
        <div id="container" class="container responCont">
            <!-- 왼쪽 네비바 -->
            <c:import url="../layout/nav_signUp.jsp"/>
            <!-- contents -->
            <div id="contents" class="eduIntroCont">
                <!-- location -->
                <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
                </span><span class="on"> 회원 가입</span>
                <!-- //location -->

                <h3 class="pgTit">회원 가입</h3>

                <!-- 본문 -->
                <h1>회원가입을 축하합니다!</h1>
                <a href="/">로그인</a>
                <!-- 본문 끝 -->
            </div>
            <!-- //contents -->
        </div>

        <!-- footer -->
        <c:import url="/WEB-INF/views/layout/footer.jsp" />
    </div>
    </body>

    </html>