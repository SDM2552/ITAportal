<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>수료 강의 목록</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_student.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
                <span>수업 <i class="fa-solid fa-angle-right"></i> </span><span class="on">수료현황 </span>
            </div>
            <!-- //location -->

            <h3 class="pgTit">수료 페이지</h3>

            <!-- 본문 -->
            <h4 class="subTit">나의 수료 목록</h4>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="15%">
                        <col width="20%">
                        <col width="20%">
                        <col width="30%">
                        <col width="15%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">과목명</th>
                        <th scope="col">출석률(%)</th>
                        <th scope="col">과제제출여부</th>
                        <th scope="col">수료일자</th>
                        <th scope="col">수료여부</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="exam" items="${examList}">
                        <tr>
                            <td>${exam.programName}</td>
                            <td></td>
                            <td>${exam.examStatus == 'Submitted' ? '제출' : '미제출'}</td>
                            <td>${exam.endDate}</td>
                            <td></td>
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
    <c:import url="../layout/footer.jsp"/>

</div>
</body>
</html>
