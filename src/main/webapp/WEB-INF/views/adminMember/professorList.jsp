<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>강사 명단 조회</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_member.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span class="on">회원 관리 <i class="fa-solid fa-angle-right"></i></span><span class="on"> 강사 명단 조회</span>
            <!-- //location -->
            <h3 class="pgTit">강사 명단 조회</h3>
            <!-- 본문 -->
            <h4 class="subTit">강사 명단</h4>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="15%">
                        <col width="15%">
                        <col width="30%">
                        <col width="25%">
                        <col width="25%">
                        <col width="25%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">강사번호</th>
                        <th scope="col">이름</th>
                        <th scope="col">생년월일</th>
                        <th scope="col">성별</th>
                        <th scope="col">주소</th>
                        <th scope="col">전화번호</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${professors}" var="professors">
                        <tr>
                            <td>${professors.idProf}</td>
                            <td>${professors.name}</td>
                            <td>${professors.birth}</td>
                            <td>${professors.gender}</td>
                            <td>${professors.address}</td>
                            <td>${professors.tel}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>
</body>

</html>