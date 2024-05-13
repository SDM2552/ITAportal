<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>프로그램 추가</title>
</head>
<body>
<form id="progInputForm" method="post" action="/progInsert">
    <div class="form-group">
        <label for="programName">교육분류명</label>
        <input type="text" class="form-control" id="programName" placeholder="교육분류명 입력" name="programName">
    </div>
    <div class="form-group">
        <label for="progDesc">교육과정내용</label>
        <input type="text" class="form-control" id="progDesc" placeholder="교육과정내용 입력" name="progDesc">
    </div>
    <button type="submit" class="btn btn-primary" >제출</button>
</form>













<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>