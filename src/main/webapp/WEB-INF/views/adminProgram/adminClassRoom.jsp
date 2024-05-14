<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>강의실관리</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header_admin.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_program.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동></span>
                <span>강의관리></span>
                <span class="on">강의실관리</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>강의실관리</h3>

            <!-- 본문 -->

            <div class="category">
                <h2>￭강의실</h2>
                <table class="category-table">

                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>강의실명</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="cr" items="${classRoom}">
                        <tr>
                            <td>${cr.idRoom}</td>
                            <td>${cr.roomName}</td>
                            <td class="actions">
                                <a href="classRoomUpdateInput?idRoom=${cr.idRoom}">수정</a>
                                <a href="classRoomDelete?idRoom=${cr.idRoom}">삭제</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <a href="/classRoomInput">
                    <button style="float: right;">추가</button>
                </a>
                <br>
            </div>
                <!-- 프로그램 목록 -->




            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp"/>
</div>
</body>

</html>