<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
</head>
<body>
<h3>아이디 찾기</h3>
<form action="/user/findId" method="post" onsubmit="return validateFindIdForm();">
    <div>
        <label for="name">성명:</label>
        <input type="text" id="name" name="name" required>
    </div>
    <div>
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required>
    </div>
    <button type="submit">아이디 찾기</button>
</form>

<script>
    function validateFindIdForm() {
        var name = document.getElementById("name").value.trim();
        var email = document.getElementById("email").value.trim();
        if (name === "" || email === "") {
            alert("성명과 이메일을 모두 입력해주세요.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
