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
<c:import url="layout/header.jsp" />

    <!-- contents -->
    <div class="mainArea">
        <img src="image/academy.jpg" alt="" class="mainImg">

        <div class="mainBoard">
            <div class="memberInfo">
                <li style="font-weight: 600; font-size: 18px; width: 100%;">
                    &nbsp;<i class="fa-solid fa-user"></i>&nbsp; ${loginUser.loginId}님 환영합니다.
                    <hr style="margin-top: 3px;">
                    <table>
                        <tr>
                            <td>이름</td>
                            <td>${userInfo.name}</td>
                        </tr>
                        <tr>
                            <td>직업</td>
                            <td>${role}</td>
                        </tr>
                        <tr>
                            <td>가입일</td>
                            <td>${registDate}</td>
                        </tr>
                        <tr>
                            <td>학적상태 </td>
                            <td>재학</td>
                        </tr>
                    </table>

                    <div class="profileButton">
                        <button onclick="location.href='#'">마이페이지</button>
                        <button onclick="location.href='#'">로그아웃</button>
                    </div>
                </li>
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
</body>

</html>