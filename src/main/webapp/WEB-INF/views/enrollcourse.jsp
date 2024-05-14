<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>수강 신청</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
</head>
<body>
<div class="wrap">
    <h1>수강 신청</h1>
    <form id="enrollmentForm" action="/course/apply" method="post">
        <label for="courseName">강의명:</label>
        <input type="text" id="courseName" name="courseName"><br>
        <label for="courseApplyDate">신청 날짜:</label>
        <input type="date" id="courseApplyDate" name="courseApplyDate"><br>
        <label for="idStudent">학생 ID:</label>
        <input type="text" id="idStudent" name="idStudent"><br>
        <label for="cateId">카테고리 ID:</label>
        <input type="text" id="cateId" name="cateId"><br>
        <button type="submit">신청하기</button>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $('#enrollmentForm').on('submit', function(e) {
        e.preventDefault(); // 폼 기본 제출 방지
        var formData = $(this).serialize(); // 폼 데이터 직렬화
        $.ajax({
            url: $(this).attr('action'),
            type: 'POST',
            data: formData,
            success: function(response) {
                alert('수강 신청이 완료되었습니다.');
            },
            error: function() {
                alert('수강 신청에 실패하였습니다.');
            }
        });
    });
</script>
</body>
</html>