<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="leftWrap" id="lnb">
    <h2 class="ltit">공지사항</h2>
    <div class="lnbArea">
        <ul>
            <li><a href="/notice/noticeList">공지사항</a></li>
            <c:choose>
                <c:when test="${sessionScope.loginUser.role eq 'admin'}">
                    <li><a href="/notice/create">공지사항 작성</a></li>
                </c:when>
                <c:otherwise>
                </c:otherwise>
            </c:choose>
            <li><a href="#">Q&A</a></li>
        </ul>
    </div>
</div>

<script type="text/javaScript">
    $(document).ready(function () {
        $(".leftWrap li:eq(0)").attr("class", "active");// 좌측 메뉴 위치
    });
</script>