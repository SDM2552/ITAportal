<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 목록</title>
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    <script>
        function goToPage() {
            var page = document.getElementById('pageInput').value;
            var totalPages = ${totalPages};
            var keyword = '${keyword}';
            if (page < 1 || page > totalPages) {
                alert('잘못된 페이지 번호입니다.');
                return;
            }
            window.location.href = '/notice/noticeList?page=' + page + '&keyword=' + keyword;
        }
    </script>
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
            <div class="btnArea">
                <form action="/notice/noticeList" method="get">
                    <input type="text" name="keyword" placeholder="검색어 입력" value="${keyword}">
                    <button type="submit">검색</button>
                    <a href="/notice/create"><button type="button">공지사항 작성</button></a>
                </form>
            </div>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="10%">
                        <col width="70%">
                        <col width="20%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>글 번호</th>
                        <th>제목</th>
                        <th>등록일</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="notice" items="${notices}">
                        <tr>
                            <td>${notice.idNotice}</td>
                            <td id="noticetitle"><a href="/notice/view/${notice.idNotice}">${notice.title}</a></td>
                            <td>${notice.createdDate}</td>
                            <td>${notice.views}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- 페이지네이션 -->
            <div class="pagination">
                <a href="/notice/noticeList?page=1&keyword=${keyword}">처음</a>
                <a href="/notice/noticeList?page=${currentPage - 1}&keyword=${keyword}" <c:if test="${currentPage == 1}">style="pointer-events: none; color: #ccc;"</c:if>><<</a>
                <a href="/notice/noticeList?page=${currentPage - 1}&keyword=${keyword}" <c:if test="${currentPage == 1}">style="pointer-events: none; color: #ccc;"</c:if>><</a>
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <a href="/notice/noticeList?page=${i}&keyword=${keyword}" class="${currentPage == i ? 'active' : ''}">${i}</a>
                </c:forEach>
                <a href="/notice/noticeList?page=${currentPage + 1}&keyword=${keyword}" <c:if test="${currentPage == totalPages}">style="pointer-events: none; color: #ccc;"</c:if>>></a>
                <a href="/notice/noticeList?page=${totalPages}&keyword=${keyword}">끝</a>
                <input type="number" id="pageInput" style="width: 50px;" min="1" max="${totalPages}" value="${currentPage}">
                <button onclick="goToPage()">이동</button>
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
