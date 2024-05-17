<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="leftWrap" id="lnb">
    <h2 class="ltit">수강신청</h2>
    <div class="lnbArea">
        <ul>
            <li><a href="#">수강신청 안내</a></li>
            <li><a href="#">교육대상자 및 교육혜택</a></li>
            <li><a href="/program/list">수강신청</a></li>
        </ul>
    </div>
</div>

<script type="text/javaScript">
    $(document).ready(function() {
        $(".leftWrap li:eq(0)").attr("class", "active");// 좌측 메뉴 위치
    });
</script>