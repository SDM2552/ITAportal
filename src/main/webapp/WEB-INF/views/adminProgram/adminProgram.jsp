<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>교육과정관리</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header_admin.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_program.jsp"/>
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
            <h4 class="subTit">카테고리</h4>
            <div class="tblData mt10" style="width: 30%">
                <table>
                    <thead>
                    <colgroup>
                        <col width="15%">
                        <col width="55%">
                        <col width="30%">
                    </colgroup>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">카테고리명</th>
                        <th scope="col">변경</th>
                    </tr>
                    <c:forEach var="category" items="${cate}">
                        <tr>
                            <td>${category.idCate}</td>
                            <td>${category.cateName}</td>
                            <td class="actions">
                                <a href="categoryUpdateInput?idCate=${category.idCate}">수정</a>
                                <a href="categoryDelete?idCate=${category.idCate}">삭제</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <a href="/categoryInput">
                    <button style="float: right;">추가</button>
                </a>
            </div><br><br>

            <!-- 프로그램 목록 -->
            <h4 class="subTit">프로그램</h4>
            <div class="tblData mt10">
                <table>
                    <thead>
                    <colgroup>
                        <col width="30%">
                        <col width="20%">
                        <col width="20%">
                        <col width="30%">
                        <col width="16%">
                        <col width="10%">
                        <col width="15%">
                        <col width="15%">
                    </colgroup>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="col">프로그램명</th>
                        <th scope="col">교육시작일자</th>
                        <th scope="col">교육종료일자</th>
                        <th scope="col">교육 대상</th>
                        <th scope="col">교육 방법</th>
                        <th scope="col">교육 인원</th>
                        <th scope="col">교육 비용</th>
                        <th scope="col">변경</th>
                    </tr>
                    <c:forEach var="program" items="${prog}">
                        <tr>
                            <td>${program.pgmName}</td>
                            <td>${program.stDt}</td>
                            <td>${program.endDt}</td>
                            <td>${program.pgmTarget}</td>
                            <td>${program.pgmMethod}</td>
                            <td>${program.pgmPer}</td>
                            <td>${program.pgmFee}</td>
                            <td class="actions">
                                <a href="progUpdateInput?idPgm=${program.idPgm}">수정</a>
                                <a href="progDelete?idPgm=${program.idPgm}">삭제</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <a href="/progInput">
                    <button style="float: right;">추가</button>
                </a>
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