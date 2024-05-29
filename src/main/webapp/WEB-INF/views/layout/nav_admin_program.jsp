<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/common.css">
<div class="leftWrap" id="lnb">
    <h2 class="ltit">강의 관리</h2>
    <div class="lnbArea">
        <ul>
            <li><a href="/adminProgram">프로그램관리</a></li>
            <li><a href="/adminCategory">카테고리관리</a></li>
            <li><a href="/adminClassRoom">강의실관리</a></li>
            <li><a href="/courseStatus/list">수강현황조회</a></li>
            <li><a href="#">휴보강신청 현황</a></li>
        </ul>
    </div>
</div>

<script type="text/javaScript">
    $(document).ready(function() {
        $(".leftWrap li:eq(0)").attr("class", "active");// 좌측 메뉴 위치
    });
</script>