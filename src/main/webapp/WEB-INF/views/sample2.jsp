<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
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
                <li style="font-weight: 600; font-size: 18px; width: 100%;"><span
                        class="material-icons">person</span>&nbsp;name님
                    환영합니다.
                    <hr style="margin-top: 3px;">
                    <table>
                        <tr>
                            <td>이메일</td>
                            <td>email@mail.com</td>
                        </tr>
                        <tr>
                            <td>소속</td>
                            <td>중국무역학과</td>
                        </tr>
                        <tr>
                            <td>학기</td>
                            <td>1학년&nbsp;1학기</td>
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