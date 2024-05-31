<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>쪽지 작성</title>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <link rel="stylesheet" type="text/css" href="../css/messenger.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h2>쪽지 작성</h2>
<form id="createMessengerForm">
    <div class="tblForm inputForm mt10">
        <table>
            <colgroup>
                <col style="width:160px">
                <col style="width:calc(100% - 160px)">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row">받는 사람 ID<span class="essR">필수</span></th>
                <td>
                    <input type="text" id="receiverLoginId" name="receiverLoginId" value="" maxlength="50" title="받는 사람 ID 입력">
                </td>
            </tr>
            <tr>
                <th scope="row">제목<span class="essR">필수</span></th>
                <td>
                    <input type="text" id="subject" name="subject" value="" maxlength="50" title="제목 입력">
                </td>
            </tr>
            <tr>
                <th scope="row">내용<span class="essR">필수</span></th>
                <td>
                    <textarea id="messageText" name="messageText" rows="10" title="내용 입력"></textarea>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <!-- //tblForm 정보입력 -->

    <!-- btn -->
    <div class="btnArea">
        <button type="button" class="btns btnSt01" onclick="sendMessenger()">전송</button>
        <button type="button" class="btns btnSt02" onclick="saveMessenger()">저장</button>
        <button type="button" class="btns btnSt03" onclick="cancelCreateMessenger()">취소</button>
    </div>
    <!-- btn -->
</form>

<script>
    function sendMessenger() {
        var form = $('#createMessengerForm');
        $.ajax({
            url: '/messenger/send',
            method: 'POST',
            data: form.serialize(),
            success: function(response) {
                alert('쪽지가 전송되었습니다.');
                $('#modal').hide();
                loadReceivedMessages();
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
                loadReceivedMessages();
            },
            error: function(xhr, status, error) {
                alert('쪽지 저장에 실패했습니다: ' + xhr.responseText);
            }
        });
    }

    function cancelCreateMessenger() {
        $('#modal').hide();
        loadReceivedMessages();
    }
    function loadReceivedMessages() {
        $.ajax({
            url: '/messenger/received',
            method: 'GET',
            success: function(data) {
                $('#messageListTitle').text('받은 메신저함');
                renderMessages(data);
            },
            error: function(xhr, status, error) {
                alert('메시지를 불러오는 데 실패했습니다: ' + xhr.responseText);
            }
        });
    }

    function loadMessengerList() {
        $.ajax({
            url: '/messenger/list',
            method: 'GET',
            success: function(response) {
                $('#modalContent').html(response);
            },
            error: function(xhr, status, error) {
                alert('메신저 리스트를 불러오는 데 실패했습니다: ' + xhr.responseText);
            }
        });
    }
</script>
</body>
</html>
