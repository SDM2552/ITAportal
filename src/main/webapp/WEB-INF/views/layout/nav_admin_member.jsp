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
        $(".leftWrap li:eq(0)").attr("class", "active");// 좌측 메뉴 위치
    });
</script>