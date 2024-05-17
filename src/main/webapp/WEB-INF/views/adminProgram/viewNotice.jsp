<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/noticeboard.css?ver=1.0">
    <title>공지사항 상세보기</title>
</head>
<body>
<h1>공지사항 상세보기</h1>
<div>
    <h2>${notice.title}</h2>
    <p>${notice.content}</p>
    <p>작성일: ${notice.createdDate}</p>
    <p>조회수: ${notice.views}</p>
</div>
<a href="/notice/noticeList">목록으로</a>
</body>
</html>