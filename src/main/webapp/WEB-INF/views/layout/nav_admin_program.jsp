<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/common.css">
<div class="leftWrap" id="lnb">
    <h2 class="ltit">콘텐츠 관리</h2>
    <div class="lnbArea">
        <ul>
            <li><a href="/adminCategory">카테고리 관리</a></li>
            <li><a href="/adminProgram">프로그램 관리</a></li>
            <li><a href="/adminClassRoom">강의실 관리</a></li>
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