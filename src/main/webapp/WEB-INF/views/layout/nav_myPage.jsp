<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/common.css">
<div class="leftWrap" id="lnb">
    <h2 class="ltit">마이페이지</h2>
    <div class="lnbArea">
        <ul>
            <li><a href="/user/info">회원정보</a></li>
            <li><a href="/user/deleteInfo">회원탈퇴</a></li>
            <li><a href="/notice/noticeList">공지사항</a></li>

        </ul>
    </div>
</div>

<script type="text/javaScript">
    $(document).ready(function() {
        $(".leftWrap li:eq(0)").attr("class", "active");// 좌측 메뉴 위치
    });
</script>