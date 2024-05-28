<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>강의실관리</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_program.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span class="on">강의 관리 <i class="fa-solid fa-angle-right"></i></span><span class="on"> 강의실 관리</span>
            <!-- //location -->

            <h3 class="pgTit">강의실 관리</h3>

            <!-- 본문 -->
            <h4 class="subTit">강의실</h4>
            <div class="tblData mt10" style="width: 30%">
                <table>
                    <colgroup>
                        <col width="15%">
                        <col width="55%">
                        <col width="30%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">강의실명</th>
                        <th scope="col">변경</th>
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
            </div><br><br><br><br>

            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp"/>
</div>
</body>

</html>