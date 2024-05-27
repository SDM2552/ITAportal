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
        <c:import url="../layout/nav_admin_notice.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span class="on"> 공지사항</span>
            <!-- //location -->

            <h3 class="pgTit">공지사항</h3>

            <!-- 본문 -->
            <!-- 공지사항 상세보기 -->
            <div class="innerContView mt10">

                <!-- 공지사항 영역 -->
                <div class="viewArea">
                    <div class="titArea">
                        <h4 class="tit">${notice.title}</h4>
                        <div class="dateArea">
                            <span class="line">글번호 : ${notice.idNotice}</span>
                            <span class="line">등록일 : ${notice.createdDate}</span>
                            <span class="line">조회수 : ${notice.views}</span>
                        </div>
                    </div>
                    <!-- 본문 -->
                    <div class="viewCon">
                        <p style="white-space: pre-line; font-size: 16px">${notice.content }</p>
                    </div>
                    <!-- 본문 끝 -->


                </div>
            </div>
            <!-- //공지사항 영역 -->

            <!-- btn -->
            <div class="btnArea">
                <a href="/notice/noticeList" class="btns btnSt02">
                    <span>목록</span>
                </a>
            </div>
            <!-- btn -->
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp"/>
</div>
</body>
</html>
