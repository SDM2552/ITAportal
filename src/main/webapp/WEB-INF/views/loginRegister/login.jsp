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
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="/WEB-INF/views/layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동</span>
                <span>수강 내역 조회</span>
                <span class="on">수강 내역</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>로그인</h3>

            <!-- 본문 -->
            <div class="login-container">
                <h2>Login</h2>
                <form action="../notice/dashboard.jsp" method="post">
                    <div class="form-group">
                        <label for="logId">logId:</label>
                        <input type="text" id="logId" name="logId" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <div class="form-group">
                        <button type="submit">Login</button>
                    </div>
                </form>

                <!-- 회원가입 버튼 -->
                <div class="form-group">
                    <button type="button" onclick="location.href='/user/signUp1'">회원가입</button>
                </div>

                <!-- 아이디 찾기 버튼 -->
                <div class="form-group">
                    <button type="button" onclick="location.href='/user/findId'">아이디 찾기</button>
                </div>
            </div>
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>
</body>

</html>