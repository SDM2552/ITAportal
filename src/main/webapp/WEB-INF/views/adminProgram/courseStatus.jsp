<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>

    </style>
    <title>교육과정관리</title>
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
            <span>강의 관리 <i class="fa-solid fa-angle-right"></i></span><span class="on"> 수강현황조회</span>
            <!-- //location -->

            <h3 class="pgTit">수강현황조회</h3>

            <!-- 본문 -->

            <!-- 프로그램 목록 -->
            <h4 class="subTit">신청자 목록</h4>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="13%">
                        <col width="20%">
                        <col width="10%">
                        <col width="17%">
                        <col width="8%">
                        <col width="8%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">카테고리</th>
                        <th scope="col">강의명</th>
                        <th scope="col">신청자</th>
                        <th scope="col">수강신청일</th>
                        <th scope="col">신청 상태</th>
                        <th scope="col">승인</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="sugang" items="${sugangList}">
                        <tr>
                            <td>${sugang.cateName}</td>
                            <td>${sugang.pgmName}</td>
                            <td>${sugang.stuName}</td>
                            <td>${sugang.sugangStDt}</td>
                            <td>${sugang.status}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${sugang.status == '신청중'}">
                                        <button type="button" onclick="sugangOk(${sugang.idPgm}, ${sugang.idStudent})">승인</button>
                                        <button type="button" onclick="sugangNo(${sugang.idPgm}, ${sugang.idStudent})">거부</button>
                                    </c:when>
                                    <c:otherwise>
                                        -
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- Pagination -->
            <div class="pagination">
                <c:forEach var="i" begin="1" end="${(totalCount + pageSize - 1) / pageSize}">
                    <c:choose>
                        <c:when test="${page == i}">
                            <span class="active">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${i}&pageSize=${pageSize}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>
    <!-- footer -->
    <c:import url="../layout/footer.jsp"/>
</div>
<script>
    function sugangOk(idPgm, idStudent) {
        if (confirm('수강을 승인하시겠습니까?')) {
            fetch('/admin/sugangOk', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    idPgm: idPgm,
                    idStudent: idStudent
                })
            })
                .then(response => response.text())
                .then(data => {
                    alert(data);
                    location.reload();
                })
                .catch(error => {
                    alert('승인에 실패했습니다.');
                    console.error('Error:', error);
                });
        }
    }
    function sugangNo(idPgm, idStudent) {
        if (confirm('수강을 거부하시겠습니까?')) {
            fetch('/admin/sugangNo', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    idPgm: idPgm,
                    idStudent: idStudent
                })
            })
                .then(response => response.text())
                .then(data => {
                    alert(data);
                    location.reload();
                })
                .catch(error => {
                    alert('거부에 실패했습니다.');
                    console.error('Error:', error);
                });
        }
    }

</script>
</body>

</html>