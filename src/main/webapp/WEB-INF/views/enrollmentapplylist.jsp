<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>My Enrollment</title>
</head>
<body>
<h1>내 수강 신청 목록</h1>
<table border="1">
    <tr>
        <th>과목명</th>
        <th>신청 날짜</th>
        <th>상태</th>
    </tr>
    <c:forEach items="${enrollments}" var="enrollment">
        <tr>
            <td>${enrollment.pgmName}</td>  <!-- EL 표현식 수정 -->
            <td>${enrollment.stDt}</td>      <!-- EL 표현식 수정 -->
            <td>${enrollment.status}</td>   <!-- EL 표현식 수정 -->
        </tr>
    </c:forEach>
</table>
</body>
</html>