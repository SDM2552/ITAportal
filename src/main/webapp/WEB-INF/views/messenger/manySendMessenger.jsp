<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>대량 전송</title>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <link rel="stylesheet" type="text/css" href="../css/messenger.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h2>대량 전송</h2>
<form id="bulkSendForm">
    <div class="tblForm inputForm mt10">
        <table>
            <colgroup>
                <col style="width:160px">
                <col style="width:calc(100% - 160px)">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row">받는 사람 IDs<span class="essR">필수</span></th>
                <td>
                    <input type="text" name="receiverLoginIds" required>
                </td>
            </tr>
            <tr>
                <th scope="row">제목<span class="essR">필수</span></th>
                <td>
                    <input type="text" name="subject" required>
                </td>
            </tr>
            <tr>
                <th scope="row">내용<span class="essR">필수</span></th>
                <td>
                    <textarea name="messageText" rows="10" cols="30" required></textarea>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <!-- btn -->
    <div class="btnArea">
        <button type="button" class="btns btnSt01" onclick="sendBulkMessages()">전송</button>
        <button type="button" class="btns btnSt03" onclick="parent.closeModal()">취소</button>
    </div>
    <!-- btn -->
</form>

<script>
    function sendBulkMessages() {
        var form = $('#bulkSendForm');
        var data = {
            receiverLoginIds: form.find('input[name="receiverLoginIds"]').val().split(',').map(String),
            subject: form.find('input[name="subject"]').val(),
            messageText: form.find('textarea[name="messageText"]').val()
        };

        $.ajax({
            url: '/messenger/sendBulk',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function() {
                parent.closeModal();
                parent.loadSentMessages();
            }
        });
    }
</script>
</body>
</html>