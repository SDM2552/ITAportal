<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/checkSession.js" defer></script>
    <title>수강 신청</title>
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
                <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
                <span>수강 신청  </span>
            </div>
            <!-- //location -->

            <h3 class="pgTit">수강 신청</h3>

            <!-- 본문 -->
            <div class="boardSearch_g type">
                <span class="tit">분류 </span>
                <select title="선택" id="lecIdxSel" name="cateName">
                    <option value="">전체</option>
                    <c:forEach var="category" items="${categories}">
                        <option value="${category.cateName}">${category.cateName}</option>
                    </c:forEach>
                </select>
                <span class="tit">프로그램명</span>
                <input type="text" title="키워드 입력" placeholder="프로그램명을 입력하세요" id="proTitleSel" name="pgmName" value=""/>
                <button type="button" class="btn_search" onclick="searchPrograms()">검색</button>
            </div>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="5%">
                        <col width="15%">
                        <col width="25%">
                        <col width="25%">
                        <col width="20%">
                        <col width="13%">
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
                    <tbody id="latestNotices">
                    <c:forEach var="program" items="${programs}">
                        <tr>
                            <td>${program.idPgm}</td>
                            <td>${program.cateName}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${program.sugangClosed}">
                                       ${program.pgmName}
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:void(0);" onclick="applyProgram(${program.idPgm});">${program.pgmName}</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${program.stDt} ~ ${program.endDt}</td>
                            <td>${program.sugangStDt} 09:00 ~<br>
                                    ${program.sugangEndDt} 18:00</td>
                            <td>
                                <c:choose>
                                    <c:when test="${program.sugangClosed}">
                                        <button type="button" class="s1" disabled>마감</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="button" class="s1" onclick="applyProgram(${program.idPgm});">수강신청</button>
                                    </c:otherwise>
                                </c:choose>
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
            url: '/search/program',
            type: 'GET',
            data: {
                cateName: cateName,
                pgmName: pgmName
            },
            success: function(data) {
                renderPrograms(data.programs);
            },
            error: function(error) {
                console.error('Error fetching programs:', error);
            }
        });
    }

    function renderPrograms(programs) {
        var tbody = $('#latestNotices');
        tbody.empty(); // 기존 내용을 제거

        programs.forEach(function(program) {
            var row = '<tr>' +
                '<td>' + program.idPgm + '</td>' +
                '<td>' + program.cateName + '</td>' +
                '<td>' + program.pgmName + '</td>' +
                '<td>' + program.stDt + ' ~ ' + program.endDt + '</td>' +
                '<td>' + program.sugangStDt + ' 09:00 ~<br>' + program.sugangEndDt + ' 18:00</td>' +
                '<td>';
            if (program.sugangClosed) {
                row += '<button type="button"  class="s1" disabled>마감</button>';
            } else {
                row += '<button type="button" class="s1 logincheck" onclick="applyProgram(' + program.idPgm + ', event);">수강신청</button>';
            }
            row += '</td></tr>';
            tbody.append(row);
        });
    }
    function applyProgram(programId, event) {
        window.location.href = '/program/applyForm?id=' + programId;
    }

</script>
</body>
</html>
