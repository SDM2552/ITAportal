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
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span class="on"> 비밀번호 찾기</span>
            <!-- //location -->

            <h3 class="pgTit">비밀번호 찾기</h3>
            <!-- 본문 -->
            <div class="innerContView">
                <p class="descTxt">국제무역아카데미에 오신걸 환영합니다.</p>

                <!-- 비밀번호 찾기 영역 -->
                <form id="findPasswordForm" onsubmit="return openResultWindow();">
                    <div class="LoginBox">
                        <p class="logInfo"> 아이디와 이메일을 입력하여 비밀번호를 찾을 수 있습니다.</p>
                        <div class="loginFormBorder">
                            <ul class="loginForm">
                                <li>
                                    <input type="text" class="inTxt" id="loginId" name="loginId" maxlength="20" placeholder="  아이디" title="아이디 입력">
                                </li>
                                <li>
                                    <input type="email" class="inTxt" id="email" name="email" maxlength="50" placeholder=" 이메일" title="이메일 입력">
                                </li>
                            </ul>
                            <button type="submit" class="logBtn">
                                <span>비밀번호 찾기</span>
                            </button>
                        </div>
                        <span class="checkboxWrap"></span>
                    </div>
                </form>
                <!-- //비밀번호 찾기 영역 -->
            </div>
            <!--//비밀번호 찾기 -->
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="/WEB-INF/views/layout/footer.jsp"/>
</div>
<script>
    function openResultWindow() {
        var loginId = document.getElementById("loginId").value.trim();
        var email = document.getElementById("email").value.trim();
        if (loginId === "" || email === "") {
            alert("아이디와 이메일을 모두 입력해주세요.");
            return false;
        }

        var form = document.getElementById("findPasswordForm");
        var width = 400;
        var height = 300;
        var left = (screen.width / 2) - (width / 2);
        var top = (screen.height / 2) - (height / 2);

        window.open('', 'resultWindow', 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left);

        form.target = 'resultWindow';
        form.action = '/user/findPassword';
        form.method = 'post';

        return true;
    }
</script>
</body>

</html>
