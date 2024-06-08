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