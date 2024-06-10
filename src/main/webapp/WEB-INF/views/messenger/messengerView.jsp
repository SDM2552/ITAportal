<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>메신저 보기</title>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <link rel="stylesheet" type="text/css" href="../css/messenger.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h2>메신저 내용</h2>
<div class="tblForm inputForm mt10">
    <table>
        <colgroup>
            <col style="width:160px">
            <col style="width:calc(100% - 160px)">
        </colgroup>
        <tbody>
        <tr>
            <th scope="row">보낸 사람</th>
            <td>${messenger.senderLoginId}</td>
        </tr>
        <tr>
            <th scope="row">받는 사람</th>
            <td>${messenger.receiverLoginId}</td>
        </tr>
        <tr>
            <th scope="row">제목</th>
            <td>${messenger.subject}</td>
        </tr>
        <tr>
            <th scope="row">내용</th>
            <td>${messenger.messageText}</td>
        </tr>
        <tr>
            <th scope="row">보낸 시간</th>
            <td>${messenger.sentAt}</td>
        </tr>
        <tr>
            <th scope="row">읽음 여부</th>
            <td>${messenger.messengerRead ? '읽음' : '읽지 않음'}</td>
        </tr>
        </tbody>
    </table>
</div>
<!-- btn -->
<div class="btnArea">
    <button type="button" class="btns btnSt03" onclick="closeView()">닫기</button>
    <c:if test="${messenger.sentAt == null}">
        <button type="button" class="btns btnSt03" onclick="sendSavedMessenger(${messenger.idMessenger})">전송</button>
    </c:if>
    <c:if test="${messenger.sentAt != null}">
        <button type="button" class="btns btnSt03" onclick="location.href='/messenger/reply?idMessenger=${messenger.idMessenger}'">답장</button>
    </c:if>
</div>
<!-- btn -->

<script>
    function closeView() {
        window.history.back();
    }

    function sendSavedMessenger(idMessenger) {
        $.ajax({
            url: '/messenger/sendFromSaved',
            method: 'POST',
            data: { idMessenger: idMessenger },
            success: function(response) {
                alert('쪽지가 전송되었습니다.');
                window.history.back();
            },
            error: function(xhr, status, error) {
                alert('쪽지 전송에 실패했습니다: ' + xhr.responseText);
            }
        });
    }

    // Other functions from the messenger list page
    function replyMessenger(id) {
        // 답장 로직 추가
    }

    function updateMessenger(id) {
        var newText = prompt("메시지를 수정하세요:");
        if (newText) {
            $.ajax({
                url: '/messenger/update',
                method: 'POST',
                data: { idMessenger: id, messageText: newText },
                success: function() {
                    window.location.reload();
                }
            });
        }
    }

    function deleteMessenger(id) {
        if (confirm("정말 삭제하시겠습니까?")) {
            $.ajax({
                url: '/messenger/delete',
                method: 'POST',
                data: { idMessenger: id },
                success: function() {
                    window.history.back();
                }
            });
        }
    }

    function sendMessenger() {
        var form = $('#createMessengerForm');
        $.ajax({
            url: '/messenger/send',
            method: 'POST',
            data: form.serialize(),
            success: function(response) {
                alert('쪽지가 전송되었습니다.');
                $('#modal').hide();
                window.history.back();
            },
            error: function(xhr, status, error) {
                alert('쪽지 전송에 실패했습니다: ' + xhr.responseText);
            }
        });
    }

    function saveMessenger() {
        var form = $('#createMessengerForm');
        $.ajax({
            url: '/messenger/save',
            method: 'POST',
            data: form.serialize(),
            success: function(response) {
                alert('쪽지가 저장되었습니다.');
                $('#modal').hide();
                window.history.back();
            },
            error: function(xhr, status, error) {
                alert('쪽지 저장에 실패했습니다: ' + xhr.responseText);
            }
        });
    }
</script>
</body>
</html>
