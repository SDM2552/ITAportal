<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/common.css">
<div class="leftWrap" id="lnb">
    <h2 class="ltit">강의 관리</h2>
    <div class="lnbArea">
        <ul>
            <li><a href="/prof/list">강의계획서</a></li>
            <li><a href="#">휴보강신청</a></li>
            <li><a href="#">출석관리</a></li>
            <li><a href="#">과제관리</a></li>

        </ul>
    </div>
</div>

<script type="text/javaScript">
    $(document).ready(function() {
        $(".leftWrap li:eq(0)").attr("class", "active");// 좌측 메뉴 위치
    });
</script>