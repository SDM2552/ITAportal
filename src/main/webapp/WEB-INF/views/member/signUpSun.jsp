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
<form action="signUp2" method="post">
    <input type="hidden" name="role" value="stu">
    <button type="submit">학생</button>
</form>

<form action="signUp2" method="post">
    <input type="hidden" name="role" value="prof">
    <button type="submit">교수</button>
</form>
</body>
</html>
