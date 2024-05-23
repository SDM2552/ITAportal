<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>프로그램 검색 결과</title>
    <style>
        .btnArea {
            text-align: right;
            margin-top: 10px;
        }
        .btnArea button {
            margin-left: 10px;
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination a {
            display: inline-block;
            margin: 0 5px;
            padding: 5px 10px;
            border: 1px solid #ddd;
            color: #333;
            text-decoration: none;
        }
        .pagination a.active {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_sugang.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동</span>
                <span>수강 내역 조회</span>
                <span class="on">수강 내역</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>수강 신청</h3>

            <!-- 검색 폼 -->
            <div class="boardSearch_g type">
                <span class="tit">분류 </span>
                <select title="선택" id="lecIdxSel" name="cateName">
                    <option value="">전체</option>
                    <c:forEach var="category" items="${categories}">
                        <option value="${category.cateName}" <c:if test="${param.cateName == category.cateName}">selected</c:if>>${category.cateName}</option>
                    </c:forEach>
                </select>
                <span class="tit">프로그램명</span>
                <input type="text" title="키워드 입력" placeholder="프로그램명을 입력하세요" id="proTitleSel" name="pgmName" value="${param.pgmName}"/>
                <button type="button" class="btn_search" onclick="searchPrograms()">검색</button>
            </div>

            <!-- 본문 -->
            <div id="programTable" class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="5%">
                        <col width="15%">
                        <col width="30%">
                        <col width="25%">
                        <col width="20%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">분류</th>
                        <th scope="col">프로그램명</th>
                        <th scope="col">교육 기간</th>
                        <th scope="col">수강신청 기간</th>
                        <th scope="col">수강신청</th>
                    </tr>
                    </thead>
                    <tbody id="programsBody">
                    <c:forEach var="program" items="${programs}">
                        <tr>
                            <td>${program.idPgm}</td>
                            <td>${program.cateName}</td>
                            <td>${program.pgmName}</td>
                            <td>${program.stDt} ~ ${program.endDt}</td>
                            <td>${program.sugangStDt} ~ ${program.sugangEndDt}</td>
                            <td>
                                <button type="button" onclick="applyProgram(${program.idPgm});">수강신청</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp"/>
</div>
<script>
    function searchPrograms() {
        var cateName = $('#lecIdxSel').val();
        var pgmName = $('#proTitleSel').val();

        $.ajax({
            url: '/search/program/ajax',
            method: 'GET',
            data: {
                cateName: cateName,
                pgmName: pgmName
            },
            success: function(programs) {
                var tbody = $('#programsBody');
                tbody.empty();
                programs.forEach(function(program) {
                    var tr = $('<tr></tr>');
                    tr.append('<td>' + program.idPgm + '</td>');
                    tr.append('<td>' + program.cateName + '</td>');
                    tr.append('<td>' + program.pgmName + '</td>');
                    tr.append('<td>' + program.stDt + ' ~ ' + program.endDt + '</td>');
                    tr.append('<td>' + program.sugangStDt + ' ~ ' + program.sugangEndDt + '</td>');
                    tr.append('<td><button type="button" onclick="applyProgram(' + program.idPgm + ');">수강신청</button></td>');
                    tbody.append(tr);
                });
            }
        });
    }

    function applyProgram(programId) {
        window.location.href = '/program/applyForm?id=' + programId;
    }
</script>
</body>
</html>
