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
            <li><a href="/notice/Q&A">Q&A</a></li>
            <li><a href="/courseStatus/request">강좌개설의뢰</a></li>
        </ul>
    </div>
</div>

<script type="text/javaScript">
    $(document).ready(function() {
        $(".leftWrap li").click(function() {
            $(".leftWrap li").removeClass("active"); // 모든 항목에서 active 클래스 제거
            $(this).addClass("active"); // 클릭한 항목에 active 클래스 추가
        });

        // 현재 URL 경로에 따라 활성화할 항목 결정
        var currentPath = window.location.pathname;
        $(".leftWrap li a").each(function() {
            if ($(this).attr('href') === currentPath) {
                $(this).parent().addClass("active");
            }
        });
    });
</script>