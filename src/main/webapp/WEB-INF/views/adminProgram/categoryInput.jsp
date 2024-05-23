<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>카테고리추가</title>
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
            <h4 class="subTit">카테고리 추가</h4>
            <form id="progInputForm" method="post" action="/categoryInsert">
                <div class="tblData mt10">
                    <table>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tbody class="mid">
                        <tr>
                            <th scope="col">주제분류명</th>
                            <td colspan="3">
                                <input type="text" placeholder="주제분류명 입력"id="cateName" name="cateName"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </div>
                <div class="btnArea">
                    <button type="submit" class="btns btnSt01">
                        <span>저장</span>
                    </button>
                    <button type="button" class="btns btnSt02" onclick="history.back();">
                        <span>목록으로</span>
                    </button>
                </div>


            </form>
            <!-- 본문 끝 -->

        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>
</body>

</html>