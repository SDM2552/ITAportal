<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
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
            <h4 class="subTit">수료 과목 목록</h4>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="15%">
                        <col width="25%">
                        <col width="10%">
                        <col width="10%">
                        <col width="20%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">분류</th>
                        <th scope="col">과목명</th>
                        <th scope="col">출석률(%)</th>
                        <th scope="col">과제제출여부</th>
                        <th scope="col">수료일자</th>
                        <th scope="col">수료증 출력</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="grade" items="${grades}">
                        <tr>
                            <td>${grade.cateName}</td>
                            <td>${grade.pgmName}</td>
                            <td>${grade.attendanceRate} %</td>
                            <td>${grade.examScore == null ? '미제출' : '제출'}</td>
                            <td>${grade.endDt}</td>
                            <td><button class="s1" onclick="printCertificate('${grade.pgmName}', '${grade.stuName}')">출력</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->

    </div>
    <!-- footer -->
    <c:import url="../layout/footer.jsp"/>

</div>
<script>
    function printCertificate(pgmName, stuName) {

        $.ajax({
            url: '/api/certificate',
            method: 'POST',
            data: JSON.stringify({ pgmName: pgmName, stuName: stuName }),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function(response) {
                const url = response.url;
                window.open(url, 'certificateWindow', 'width=800,height=600');
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
    }
</script>

</body>
</html>
