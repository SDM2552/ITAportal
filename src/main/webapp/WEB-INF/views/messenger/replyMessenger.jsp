<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>메신저 답장</title>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <link rel="stylesheet" type="text/css" href="../css/messenger.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h2>메신저 답장</h2>
<div class="tblForm inputForm mt10">
    <form id="replyMessengerForm">
        <table>
            <colgroup>
                <col style="width:160px">
                <col style="width:calc(100% - 160px)">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row">받는 사람</th>
                <td>${replyMessenger.receiverLoginId}</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td>${replyMessenger.subject}</td>
            </tr>
            <tr>
                <th scope="row">내용</th>
                <td>
                    <textarea name="messageText" rows="10" cols="50"></textarea>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<!-- btn -->
<div class="btnArea">
    <button type="button" class="btns btnSt03" onclick="closeReply()">닫기</button>
    <button type="button" class="btns btnSt03" onclick="sendReply()">전송</button>
</div>
<!-- btn -->

<script>
    function closeReply() {
        window.history.back();
    }

    function sendReply() {
        var form = $('#replyMessengerForm');
        $.ajax({
            url: '/messenger/send',
            method: 'POST',
            data: form.serialize() + '&receiverLoginId=${replyMessenger.receiverLoginId}&subject=${replyMessenger.subject}',
            success: function(response) {
                alert('답장이 전송되었습니다.');
                window.history.back();
            },
            error: function(xhr, status, error) {
                alert('답장 전송에 실패했습니다: ' + xhr.responseText);
            }
        });
    }
</script>
</body>
</html>
