<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>My Courses</title>
</head>
<body>
<h1>내 수강 신청 목록</h1>
<table border="1">
    <tr>
        <th>과목명</th>
        <th>신청 날짜</th>
        <th>상태</th>
    </tr>
    <c:forEach items="${courses}" var="course">
        <tr>
            <td>${course.courseName}</td>
            <td>${course.courseApplyDate}</td>
            <td>${course.courseApplyStatus}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>