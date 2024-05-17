<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<%--    css--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/noticelist.css?ver=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>공지사항 목록</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header_admin.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_program.jsp" />
        <!-- contents -->
        <div id="contents" class="noticesListCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동></span>
                <span>관리자 페이지></span>
                <span class="on">공지사항 목록</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>공지사항 목록</h3>

            <!-- 본문 -->
            <div class="notice">
                <table class="category-table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>게시 날짜</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="notice" items="${notices}">
                        <tr>
                            <td>${notice.idNotice}</td>
                            <td><a href="/notice/view/${notice.idNotice}">${notice.title}</a></td>
                            <td>${notice.content}</td>
                            <td>${notice.createdDate}</td>
                            <td><a href="/notice/edit/${notice.idNotice}">수정</a></td>
                            <td><a href="/notice/delete/${notice.idNotice}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <a href="/notice/create">
                    <button style="float: right;">새 공지사항 작성</button>
                </a>
            </div>
            <!-- 프로그램 목록 -->
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp"/>
</div>
</body>

</html>