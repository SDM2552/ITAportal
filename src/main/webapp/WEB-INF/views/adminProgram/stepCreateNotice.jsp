<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>샘플 페이지</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header_admin.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_notice.jsp"/>
        <!-- contents -->
        <div id="contents" class="noticesListCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동></span>
                <span>관리자 페이지></span>
                <span class="on">공지사항</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>공지사항</h3>

            <!-- 본문 -->
            <div class="innerContView mt10">
            <form action="/notice/save" method="post">
                <input type="hidden" id="idNotice" name="idNotice" value="${notice.idNotice}"/>
                <label for="title">제목:</label>
                <input type="text" id="title" name="title" value="${notice.title}"/>
                <br/>
                <label for="content">내용:</label>
                <textarea id="content" name="content">${notice.content}</textarea>
                <button type="submit">저장</button>
            </form>
            <a href="/notice/noticeList">목록으로 돌아가기</a>
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
