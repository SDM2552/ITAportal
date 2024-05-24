<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="leftWrap" id="lnb">
    <h2 class="ltit">공지사항</h2>
    <div class="lnbArea">
        <ul>
            <li><a href="/notice/noticeList">공지사항</a></li>
            <li><a href="#">강좌개설의뢰</a></li>
            <li><a href="#">Q&A</a></li>

        </ul>
    </div>
</div>

<script type="text/javaScript">
    $(document).ready(function() {
        $(".leftWrap li:eq(0)").attr("class", "active");// 좌측 메뉴 위치
    });
</script>