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
                            <td>${loginUser.name}</td>
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
                    <a href="/notice/noticeList">공지사항</a>
                </h2>
                <div class="main--page--split"></div>
                <table id="latestNotices">
                    <!-- 최신 공지사항이 여기 로드됩니다 -->
                </table>
            </div>
        </div>

    </div>
    <!-- //contents -->
</div>

<!-- footer -->
<c:import url="layout/footer.jsp" />
<script>
    $(document).ready(function() {
        $.ajax({
            url: '/notice/latest',
            method: 'GET',
            success: function(data) {
                var table = $('#latestNotices');
                table.empty();
                data.forEach(function(notice) {
                    var row = $('<tr></tr>');
                    var title = $('<td></td>').append($('<a></a>').attr('href', '/notice/view/' + notice.idNotice).text(notice.title));
                    var date = $('<td></td>').text(notice.createdDate);
                    row.append(title).append(date);
                    table.append(row);
                });
            }
        });
    });
</script>
</body>

</html>