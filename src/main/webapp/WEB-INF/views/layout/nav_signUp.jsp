<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="leftWrap" id="lnb">
    <h2 class="ltit">회원 정보</h2>
    <div class="lnbArea">
        <ul>
            <li><a href="/user/signUp">회원 가입</a></li>
            <li><a href="/user/loginPage">로그인</a></li>
            <li><a href="#">아이디/비밀번호 찾기</a></li>
        </ul>
    </div>
</div>

<script type="text/javaScript">
    $(document).ready(function() {
        $(".leftWrap li:eq(0)").attr("class", "active");// 좌측 메뉴 위치
    });
</script>