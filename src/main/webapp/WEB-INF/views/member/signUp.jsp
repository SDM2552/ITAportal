<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
<h1>회원가입</h1>

<form action="signUpCheck" method="post" onsubmit="submitForm(event)">
    <div>
        <label for="loginId">아이디</label>
        <input type="text" id="loginId" placeholder="아이디"/>
    </div>
    <div>
        <label for="password">비밀번호</label>
        <input type="password" id="password" placeholder="비밀번호"/>
    </div>
    <div>
        <label for="confirmPassword">비밀번호 확인</label>
        <input type="password" id="confirmPassword" placeholder="비밀번호 확인"/>
    </div>
    <div>
        <label for="name">이름</label>
        <input type="text" id="name" placeholder="이름"/>
    </div>
    <div>
        <label for="tel">연락처</label>
        <input type="tel" id="tel" placeholder="연락처"/>
    </div>
    <div>
        <label for="address">주소</label>
        <input type="text" id="address" placeholder="주소"/>
    </div>
    <input type="hidden" id="role" value="${role}">
    <button type="submit">가입하기</button>
</form>
<script>
    // function submitForm(event) {
    //     event.preventDefault(); // 폼의 기본 동작을 막음
    //     const roleValue = document.getElementById('role').value;
    //     console.log('Role:', roleValue);
    // }
</script>
</body>
</html>
