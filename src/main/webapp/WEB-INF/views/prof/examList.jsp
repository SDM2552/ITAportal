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
    <title>샘플 페이지</title>
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
            <div class="location">
                <span class="home" title="홈">홈으로 이동</span>
                <span>수강 내역 조회</span>
                <span class="on">수강 내역</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>과제 관리</h3>

            <!-- 본문 -->
            <h4 class="subTit">과제 현황</h4>
            <div class="tblData mt10">
                <table>
                    <thead>
                    <tr>
                        <th scope="col">과목</th>
                        <th scope="col">과제명</th>
                        <th scope="col">과제 시작일</th>
                        <th scope="col">과제 마감일</th>
                        <th scope="col">제출 인원</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>무역</td>
                        <td>무슨무슨과제</td>
                        <td>오늘부터</td>
                        <td>내일까지</td>
                        <td>0/10 명</td>
                        <td><button onclick="location.href='/stu/examSubmit'">상세정보</button></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="btnArea">
                <button type="button" class="btns btnSt01" onclick="#">
                    <span>과제 생성</span>
                </button>
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