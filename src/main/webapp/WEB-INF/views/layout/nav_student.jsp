<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/common.css">
<div class="leftWrap" id="lnb">
    <h2 class="ltit">수업</h2>
    <div class="lnbArea">
        <ul>
            <li><a href="#">수강 내역 조회</a></li>
            <li><a href="#">시험 제출</a></li>
            <li><a href="#">성적 조회</a></li>
        </ul>
    </div>
</div>

<script type="text/javaScript">
    $(document).ready(function() {
        $(".leftWrap li:eq(0)").attr("class", "active");// 좌측 메뉴 위치
    });
</script>