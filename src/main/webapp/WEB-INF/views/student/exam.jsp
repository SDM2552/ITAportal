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
        <c:import url="../layout/nav_student.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
                <span>수업 <i class="fa-solid fa-angle-right"></i> </span><span>과제 제출 </span>
            </div>
            <!-- //location -->

            <h3 class="pgTit">과제 제출</h3>

            <!-- 본문 -->
            <h4 class="subTit">과제 제출 현황</h4>
            <div class="tblData mt10">
                <table>
                    <thead>
                    <tr>
                        <th scope="col">과목명</th>
                        <th scope="col">담당 강사</th>
                        <th scope="col">과제명</th>
                        <th scope="col">과제 시작일</th>
                        <th scope="col">과제 마감일</th>
                        <th scope="col">진행 상태</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="exam" items="${examList}">
                    <tr>
                        <td>${exam.programName}</td>
                        <td>${exam.profName}</td>
                        <td>${exam.name}</td>
                        <td>${exam.startDate}</td>
                        <td>${exam.endDate}</td>
                        <td>${exam.status}</td>
                        <td><button onclick="location.href='/stu/examSubmit?idExam=${exam.idExam}'">상세보기</button></td>
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