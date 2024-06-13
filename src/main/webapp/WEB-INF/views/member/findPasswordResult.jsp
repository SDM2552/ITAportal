<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 결과</title>
    <link rel="stylesheet" type="text/css" href="/css/find.css">
</head>
<body>
<h3>비밀번호 찾기 결과</h3>
<p>${message}</p>
<a href="#" onclick="openMainPage()">메인으로</a>

<script>
    function openMainPage() {
        if (window.opener) {
            window.opener.location.href = "/user/loginPage";
            window.close();
        } else {
            window.location.href = "/user/loginPage";
        }
    }
</script>
</body>
</html>
