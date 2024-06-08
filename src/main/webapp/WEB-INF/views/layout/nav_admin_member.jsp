<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="leftWrap" id="lnb">
    <h2 class="ltit">회원 관리</h2>
    <div class="lnbArea">
        <ul>
            <li><a href="/admin/studentList">학생 명단 조회</a></li>
            <li><a href="/admin/professorList">강사 명단 조회</a></li>
            <li><a href="/admin/adminList">관리자 명단 조회</a></li>
            <li><a href="/admin/registProfessor">강사 등록</a></li>
            <li><a href="/admin/registAdmin">관리자 등록</a></li>
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