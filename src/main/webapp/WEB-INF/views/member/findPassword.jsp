<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
</head>
<body>
<h3>비밀번호 찾기</h3>
<form action="/user/findPassword" method="post" onsubmit="return validateFindPasswordForm();">
    <div>
        <label for="loginId">아이디:</label>
        <input type="text" id="loginId" name="loginId" required>
    </div>
    <div>
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required>
    </div>
    <button type="submit">비밀번호 찾기</button>
</form>

<script>
    function validateFindPasswordForm() {
        var loginId = document.getElementById("loginId").value.trim();
        var email = document.getElementById("email").value.trim();
        if (loginId === "" || email === "") {
            alert("아이디와 이메일을 모두 입력해주세요.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
