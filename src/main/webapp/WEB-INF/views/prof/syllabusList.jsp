<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>강의계획서</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_prof_program.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span>강의 관리 <i class="fa-solid fa-angle-right"></i> </span><span>강의계획서 <i class="fa-solid fa-angle-right"></i> </span>
            <span class="on"> 강의계획서</span>
            <!-- //location -->

            <h3 class="pgTit">강의계획서</h3>

            <!-- 본문 -->
            <h4 class="subTit">강의계획서 목록</h4>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="6%">
                        <col width="15%">
                        <col width="30%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">강의번호</th>
                        <th scope="col">분류</th>
                        <th scope="col">강의명</th>
                        <th scope="col">상세정보</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="syllabus" items="${syllabusList}">
                        <tr>
                            <td>${syllabus.idPgm}</td>
                            <td>${syllabus.cateName}</td>
                            <td><a href="/prof/syllabus?idPgm=${syllabus.idPgm}">${syllabus.pgmName}</a></td>
                            <td><a href="/prof/syllabus?idPgm=${syllabus.idPgm}" class="s1">보기</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div><br><br><br><br><br><br><br><br><br>

            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>
</body>

</html>