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
    <c:import url="../layout/header.jsp" />

    <div id="container" class="container responCont">
        <c:import url="../layout/nav_admin_notice.jsp" />
        <div id="contents" class="noticesListCont">
            <div class="location">
                <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
                <span class="on">공지사항</span>
            </div>

            <h3 class="pgTit">공지사항</h3>

            <div class="btnArea">
                <form action="/notice/noticeList" method="get">
                    <input type="text" title="키워드 입력" placeholder="검색어 입력" id="proTitleSel" name="keyword" value="${keyword}"/>
                    <button type="submit" class="btn_search">검색</button>
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

            <div class="pagination">
                <a href="/notice/noticeList?page=1&keyword=${keyword}">처음</a>
                <a href="/notice/noticeList?page=${currentPage - 1}&keyword=${keyword}" <c:if test="${currentPage == 1}">style="pointer-events: none; color: #ccc;"</c:if>><</a>
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <a href="/notice/noticeList?page=${i}&keyword=${keyword}" class="${currentPage == i ? 'active' : ''}">${i}</a>
                </c:forEach>
                <a href="/notice/noticeList?page=${currentPage + 1}&keyword=${keyword}" <c:if test="${currentPage == totalPages}">style="pointer-events: none; color: #ccc;"</c:if>>></a>
                <a href="/notice/noticeList?page=${totalPages}&keyword=${keyword}">끝</a>
                <input type="number" id="pageInput" style="width: 50px;" min="1" max="${totalPages}" value="${currentPage}">
                <button onclick="goToPage()">이동</button>
            </div>
        </div>
    </div>

    <c:import url="../layout/footer.jsp"/>
</div>
</body>
</html>
