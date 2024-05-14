<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>수강 신청</title>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
</head>
<body>
<div id="header">
    <!-- Header content as provided earlier -->
</div>

<div class="container">
    <h1>수강 신청</h1>
    <form id="enrollmentForm" action="/enrollment/apply" method="post">
        <label for="pgmName">프로그램 이름:</label>
        <input type="text" id="pgmName" name="pgmName" required><br>

        <label for="idPgm">프로그램 코드:</label>
        <input type="text" id="idPgm" name="idPgm" required><br>

        <label for="stDt">시작 일자:</label>
        <input type="date" id="stDt" name="stDt" required><br>

        <label for="status">상태:</label>
        <select id="status" name="status">
            <option value="확인중">확인중</option>
            <option value="승인">승인</option>
            <option value="취소">취소</option>
        </select><br>

        <button type="submit">신청하기</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $('#enrollmentForm').on('submit', function(e) {
            e.preventDefault(); // Prevent the normal submission action
            var form = $(this);
            var url = form.attr('action');

            $.ajax({
                type: "POST",
                url: url,
                data: form.serialize(), // serializes the form's elements.
                success: function(data) {
                    alert('수강 신청이 성공적으로 완료되었습니다.');
                },
                error: function() {
                    alert('수강 신청 중 오류가 발생했습니다.');
                }
            });
        });
    });
</script>
</body>
</html>