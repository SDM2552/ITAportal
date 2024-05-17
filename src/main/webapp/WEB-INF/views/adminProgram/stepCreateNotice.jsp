<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/noticeboard.css?ver=1.0">
    <title>공지 작성 및 수정</title>
</head>
<body>
<h1>공지 작성 및 수정</h1>
<form action="/notice/save" method="post">
    <input type="hidden" id="idNotice" name="idNotice" value="${notice.idNotice}" />
    <label for="title">제목:</label>
    <input type="text" id="title" name="title" value="${notice.title}" />
    <br />
    <label for="content">내용:</label>
    <textarea id="content" name="content">${notice.content}</textarea>
    <br />
    <label for="createdDate">작성 날짜:</label>
    <span id="createdDate">${notice.createdDate}</span>
    <br />
    <label for="views">조회수:</label>
    <span id="views">${notice.views}</span>
    <br />
    <button type="submit">저장</button>
</form>
<a href="/notice/noticeList">목록으로 돌아가기</a>
</body>
</html>