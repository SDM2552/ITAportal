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
    <title>카테고리수정</title>
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
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span>강의 관리 <i class="fa-solid fa-angle-right"></i></span><span> 교육과정관리</span><span class="on"><i class="fa-solid fa-angle-right"></i> 카테고리 수정</span>
            <!-- //location -->

            <h3 class="pgTit">교육과정관리</h3>

            <!-- 본문 -->
            <h4 class="subTit">카테고리 수정</h4>
            <form id="progInputForm" method="post" action="/categoryUpdate">
                <input type="hidden" id="idCate" name="idCate" value="${cate.idCate}"/>
                <div class="tblData mt10" style="width: 50%">
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
                                <input type="text" placeholder="주제분류명 입력"id="cateName" name="cateName" value="${cate.cateName}"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </div>
                <div class="btnArea" style="width: 50%">
                    <button type="submit" class="btns btnSt01">
                        <span>저장</span>
                    </button>
                    <button type="button" class="btns btnSt02" onclick="history.back();">
                        <span>목록으로</span>
                    </button>
                </div>
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