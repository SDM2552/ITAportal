<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>샘플 페이지</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="layout/header_anonymous.jsp" />

    <!-- contents -->
    <div class="mainArea">
        <img src="image/academy.jpg" alt="" class="mainImg">

        <div class="mainBoard">
            <div class="memberInfo">
                <li style="font-weight: 600; font-size: 18px; width: 100%;">
                    로그인 </li>
                <div class="loginFormBorder">
                    <ul class="loginForm">
                        <li>
                            <input type="text" class="inTxt" id="loginId" name="loginId" style="ime-mode:disabled;"
                                   maxlength="20" placeholder="  아이디" title="아이디 입력">
                        </li>
                        <li>
                            <input type="password" class="inTxt" id="password" name="password"
                                   style="ime-mode:disabled;" maxlength="20" placeholder=" 비밀번호"
                                   title="비밀번호 입력">
                        </li>
                    </ul>
                    <a href="javascript:login();" class="logBtn">
                        <span>로그인</span>
                    </a>
                </div>
                <div class="profileButton">
                    <a href="#">회원 가입</a>
                    <span>|</span>
                    <a href="#">아이디 / 비밀번호 찾기</a>
                </div>
            </div>
            <div id="noticeBoard">
                <h2>
                    <a href="#">공지사항</a>
                </h2>
                <div class="main--page--split"></div>
                <table>
                    <tr>
                        <td><a href="#">[장학]&nbsp;2023학년도 교외장학재단 신규장학생 선발 결과 안내</a></td>
                        <td>2024-05-10
                    </tr>
                    <tr>
                        <td><a href="#">[일반]&nbsp;2023학년도 1학기 코로나 19 특별휴학 시행 안내</a></td>
                        <td>2024-05-10
                    </tr>
                    <tr>
                        <td><a href="#">[일반]&nbsp;2023학년도 장애 인식개선 교육(법정의무교육) 안내</a></td>
                        <td>2024-05-10
                    </tr>
                    <tr>
                        <td><a href="#">[일반]&nbsp;Gartner Research(IT 분야 시장분석) 서비스 지원 안내</a></td>
                        <td>2024-05-10
                    </tr>
                    <tr>
                        <td><a href="#">[장학]&nbsp;2023학년도 보건장학회 연구지원장학생 선발 안내</a></td>
                        <td>2024-05-10
                    </tr>

                </table>
            </div>
        </div>

    </div>
    <!-- //contents -->
</div>

<!-- footer -->
<c:import url="layout/footer.jsp" />

<script>

    // Enter 로그인 이벤트 바인딩
    window.onload = () => {
        document.querySelectorAll('#loginId, #password').forEach(element => {
            element.addEventListener('keyup', (e) => {
                if (e.keyCode === 13) {
                    login();
                }
            })
        })
    }

    function login() {

        const loginId = document.querySelector('.loginForm input[name="loginId"]').value;
        const password = document.querySelector('.loginForm input[name="password"]').value;


        if ( !loginId || !password ) {
            alert('아이디와 비밀번호를 모두 입력해 주세요.');
            return false;
        }

        $.ajax({
            url : '/user/loginCheck',
            type : 'POST',
            dataType : 'json',
            data : {
                loginId: loginId,
                password: password
            },
            async : false,
            success : function (response) {
                alert('로그인 되었습니다.>_<');
                window.location.href = "/user/logined";
            },
            error : function (request, status, error) {
                alert('아이디와 비밀번호를 확인해 주세요.');
            }
        })
    }

</script>

</body>

</html>