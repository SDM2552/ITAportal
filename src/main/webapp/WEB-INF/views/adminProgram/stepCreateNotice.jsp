<!DOCTYPE html>
<html>
<head>
    <title>공지 작성 및 수정</title>
</head>
<body>
<h1>공지 작성 및 수정</h1>
<form action="save" method="post">
    <input type="hidden" id="idNotice" name="idNotice" value="${notice.idNotice}" />
    <label for="title">제목:</label>
    <input type="text" id="title" name="title" value="${notice.title}" />
    <br />
    <label for="content">내용:</label>
    <textarea id="content" name="content">${notice.content}</textarea>
    <br />
    <button type="submit">저장</button>
</form>
<a href="/notice/noticeList">목록으로 돌아가기</a>
</body>
</html>