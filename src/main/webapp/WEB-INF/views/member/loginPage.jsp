<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <link rel="stylesheet" type="text/css" href="../css/login.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>로그인 페이지</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="/WEB-INF/views/layout/header.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_signUp.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i
                    class="fa-solid fa-angle-right"></i></span>
            <span class="on"> 로그인</span>
            <!-- //location -->

            <h3 class="pgTit">로그인</h3>
            <!-- 본문 -->
            <!-- 로그인 -->
            <div class="innerContView">

                <p class="descTxt">국제무역아카데미에 오신걸 환영합니다.</p>

                <!-- 로그인 영역 -->
                <form action="/user/loginPage-login" method="post">
                    <div class="LoginBox">
                        <p class="logInfo"> 로그인 후 국제무역아카데미 관련 상담 및 증명서발급, 개인 학적정보 등 다양한 정보를 확인할 수 있습니다.</p>
                        <div class="loginFormBorder">
                            <ul class="loginForm">
                                <li>
                                    <input type="text" class="inTxt" id="loginId" name="loginId"
                                           style="ime-mode:disabled;" maxlength="20" placeholder="  아이디"
                                           title="아이디 입력">
                                </li>
                                <li>
                                    <input type="password" class="inTxt" id="password" name="password"
                                           style="ime-mode:disabled;" maxlength="20" placeholder=" 비밀번호"
                                           title="비밀번호 입력">
                                </li>
                            </ul>
                            <c:if test="${not empty error}">
                                <div class="error">${error}</div>
                            </c:if>
                            <button type="submit" class="logBtn">
                                <span>로그인</span>
                            </button>
                        </div>
                        <span class="checkboxWrap">
                                <input type="checkbox" id="m_szSaveIdChk" name="m_szSaveIdChk" class="chk"
                                       onclick="fnSaveId();" />
                                <label for="m_szSaveIdChk">아이디 저장</label>
                            </span>

                        <div class="links">
                            <a href="/">홈으로</a>&nbsp&nbsp|&nbsp&nbsp
                            <a href="/user/findId">아이디 찾기</a>&nbsp&nbsp|&nbsp&nbsp
                            <a href="/user/findPassword">비밀번호 찾기</a>
                        </div>
                    </div>
                </form>
                <!-- //로그인 영역 -->
            </div>
            <!--//로그인 -->
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="/WEB-INF/views/layout/footer.jsp"/>
</div>
</body>

</html>