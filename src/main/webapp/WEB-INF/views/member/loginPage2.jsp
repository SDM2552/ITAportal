<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/loginPage.css">
    <title>로그인 페이지</title>
</head>
<body>
<div class="container">
    <div class="login-box">
        <h2>로그인</h2>
        <form action="/user/loginPage-login" method="post">
            <div class="inputGroup">
                <label for="loginId">아이디</label>
                <input type="text" id="loginId" name="loginId" required>
            </div>
            <div class="inputGroup">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="checkboxGroup">
                <input type="checkbox" id="keepLoggedIn" name="keepLoggedIn">
                <label for="keepLoggedIn">로그인 상태 유지</label>
            </div>
            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>
            <button type="submit" class="login-btn">로그인</button>
        </form>
        <div class="links">
            <a href="/">홈으로</a>
            <a href="/user/forgotId">아이디 찾기</a>
            <a href="/user/forgotPassword">비밀번호 찾기</a>
        </div>
    </div>
</div>
</body>
</html>
