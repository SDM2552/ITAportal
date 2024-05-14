<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>프로그램추가</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_program.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동></span>
                <span>강의관리></span>
                <span class="on">교육과정관리</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>교육과정관리</h3>

            <!-- 본문 -->
            <form id="progInputForm" method="post" action="/progInsert">

                <div class="form-group">
                    <label for="idCate">주제분류코드 :</label>
                    <input type="text" class="form-control" id="idCate" placeholder="주제분류코드" name="idCate">
                </div>
                <div class="form-group">
                    <label for="idRoom">강의실코드 :</label>
                    <input type="text" class="form-control" id="idRoom" placeholder="강의실코드" name="idRoom">
                </div>


                <div class="form-group">
                    <label for="pgmName">프로그램명 :</label>
                    <input type="text" class="form-control" id="pgmName" placeholder="프로그램명 입력" name="pgmName">
                </div>
                <div class="form-group">
                    <label for="stDt">교육시작일자 :</label>
                    <input type="text" class="form-control" id="stDt" placeholder="교육시작일자" name="stDt">
                </div>
                <div class="form-group">
                    <label for="endDt">교육종료일자 :</label>
                    <input type="text" class="form-control" id="endDt" placeholder="교육종료일자" name="endDt">
                </div>
                <div class="form-group">
                    <label for="pgmTarget">교육대상 : </label>
                    <input type="text" class="form-control" id="pgmTarget" placeholder="교육대상" name="pgmTarget">
                </div>
                <div class="form-group">
                    <label for="pgmMethod">교육방법 : </label>
                    <input type="text" class="form-control" id="pgmMethod" placeholder="교육방법" name="pgmMethod">
                </div>
                <div class="form-group">
                    <label for="pgmPer">교육인원 : </label>
                    <input type="text" class="form-control" id="pgmPer" placeholder="교육인원" name="pgmPer">
                </div>
                <div class="form-group">
                    <label for="pgmFee">교육비 : </label>
                    <input type="text" class="form-control" id="pgmFee" placeholder="교육비" name="pgmFee">
                </div>
                <button type="submit" class="btn btn-primary">제출</button>
            </form>

            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>
</body>

</html>