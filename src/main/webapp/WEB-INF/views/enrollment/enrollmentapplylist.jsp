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
    <title>수강내역목록</title>
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
                <span class="home" title="홈">홈으로 이동></span>
                <span>수업></span>
                <span class="on">수강 내역 조회</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>수강 내역 조회</h3>

            <!-- 본문 -->
            <h4 class="subTit">수강 내역 조회</h4>
            <div class="tblData mt10">
                <table>
                    <thead>
                    <tr>
                        <th scope="col">분류</th>
                        <th scope="col">프로그램명</th>
                        <th scope="col">교육 기간</th>
                        <th scope="col">신청일</th>
                        <th scope="col">수강료</th>
                        <th scope="col">수강 상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>무역</td>
                        <td>김교수</td>
                        <td>무슨무슨과제</td>
                        <td>오늘부터</td>
                        <td>내일까지</td>
                        <td>아직임</td>
                        <td><button onclick="location.href='/stu/examSubmit'">제출</button></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <c:forEach items="${enrollments}" var="enrollment">
                <tr>
                    <td><a href="enrollment?idEnrollment=${enrollment.idEnrollment}"/> ${enrollment.pgmName}</td>  <!-- EL 표현식 수정 -->
                    <td>${enrollment.stDt}</td>      <!-- EL 표현식 수정 -->
                    <td>${enrollment.status}</td>   <!-- EL 표현식 수정 -->
                </tr>
            </c:forEach>
                </tbody>
            </table>
            <!-- 본문 끝 -->
        </div>
            <!-- //contents -->

    </div>
        <!-- footer -->
        <c:import url="../layout/footer.jsp"/>

</div>
</body>

</html>