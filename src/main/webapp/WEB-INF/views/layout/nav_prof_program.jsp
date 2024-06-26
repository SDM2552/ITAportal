<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/common.css">
<div class="leftWrap" id="lnb">
    <h2 class="ltit">강의 관리</h2>
    <div class="lnbArea">
        <ul>
            <li><a href="/prof/list">내 강의 목록</a></li>
            <li><a href="/prof/syllabusList?idPgm=${idProf}">강의계획서</a></li>
            <li><a href="/prof/examList?idPgm=${idProf}">과제관리</a></li>
            <li><a href="/prof/scheduleList">휴보강신청</a></li>
        </ul>
    </div>
</div>

<script type="text/javaScript">
    $(document).ready(function() {
        $(".leftWrap li").click(function() {
            $(".leftWrap li").removeClass("active");
            $(this).addClass("active");
        });

        var currentPath = window.location.pathname;
        $(".leftWrap li a").each(function() {
            if ($(this).attr('href') === currentPath) {
                $(this).parent().addClass("active");
            }
        });
    });
</script>