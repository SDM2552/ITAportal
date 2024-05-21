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
<script>
    <%--var userRole = '<%= session.getAttribute("loginUser") != null ? session.getAttribute("loginUser").getRole() : "" %>';--%>
    $(document).ready(function() {
        // 관리자 권한 체크
        if (userRole !== 'admin') {
            // 관리자가 아닌 경우 저장 버튼 숨김
            $('.noticecreate').hide();
        }
    });
</script>
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
            <div class="tblData mt10">
                <table>
                    <thead>
                    <colgroup>
                        <col width="10%">
                        <col width="70%">
                        <col width="20%">
                        <col width="10%">
                    </colgroup>

                    </thead>
                    <tbody>
                    <tr>
                        <th>글 번호</th>
                        <th>제목</th>
                        <th>등록일</th>
                        <th>조회수</th>

                    </tr>
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
            <a href="/notice/create"><button class="noticecreate">공지사항 작성</button></a>

            <!-- 페이지네이션 -->
            <div class="pagination">
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <a href="/notice/page/${i}" class="${currentPage == i ? 'active' : ''}">${i}</a>
                </c:forEach>
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
