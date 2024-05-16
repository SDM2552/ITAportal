<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>마이페이지</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_stu_myPage.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동</span>
                <span>수강 내역 조회</span>
                <span class="on">수강 내역</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>마이페이지</h3>
            <table class="table table-bordered">
<%--                <tr>--%>
<%--                    <th>아이디</th>--%>
<%--                    <td th:text="${user.idUser}"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <th>비밀번호</th>--%>
<%--                    <td th:text="${user.password}"></td>--%>
<%--                </tr>--%>
                <tr>
                    <th>이름</th>
                    <td th:text="${user.name}"></td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td th:text="${user.birth}"></td>
                </tr>
                <tr>
                    <th>휴대전화</th>
                    <td th:text="${user.tel}"></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td th:text="${user.address}"></td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td th:text="${user.gender == 'M' ? '남성' : '여성'}"></td>
                </tr>
            </table>
            <!-- 본문 -->

            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>
</body>

</html>