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
        <label for="cateId">주제분류코드</label>
        <input type="text" class="form-control" id="cateId" placeholder="주제분류코드" name="cateId">
    </div>
    <div class="form-group">
        <label for="roomId">강의실코드</label>
        <input type="text" class="form-control" id="roomId" placeholder="강의실코드" name="roomId">
    </div>


    <div class="form-group">
        <label for="pgmName">프로그램명</label>
        <input type="text" class="form-control" id="pgmName" placeholder="프로그램명 입력" name="pgmName">
    </div>
    <div class="form-group">
        <label for="stDt">교육시작일자</label>
        <input type="text" class="form-control" id="stDt" placeholder="교육시작일자" name="stDt">
    </div>
    <div class="form-group">
        <label for="endDt">교육종료일자</label>
        <input type="text" class="form-control" id="endDt" placeholder="교육종료일자" name="endDt">
    </div>
    <div class="form-group">
        <label for="pgmTarget">교육대상</label>
        <input type="text" class="form-control" id="pgmTarget" placeholder="교육대상" name="pgmTarget">
    </div>
    <div class="form-group">
        <label for="pgmMethod">교육방법</label>
        <input type="text" class="form-control" id="pgmMethod" placeholder="교육방법" name="pgmMethod">
    </div>
    <div class="form-group">
        <label for="pgmPer">교육인원</label>
        <input type="text" class="form-control" id="pgmPer" placeholder="교육인원" name="pgmPer">
    </div>
    <div class="form-group">
        <label for="pgmFee">교육비</label>
        <input type="text" class="form-control" id="pgmFee" placeholder="교육비" name="pgmFee">
    </div>
    <button type="submit" class="btn btn-primary">제출</button>
</form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>