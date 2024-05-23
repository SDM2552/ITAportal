<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>메신저</title>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <link rel="stylesheet" type="text/css" href="../css/messenger.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function() {
            loadReceivedMessages();

            $('#receivedBtn').click(function() {
                loadReceivedMessages();
            });

            $('#sentBtn').click(function() {
                loadSentMessages();
            });

            $('#createBtn').click(function() {
                showCreateMessengerModal();
            });

            $('#bulkDeleteBtn').click(function() {
                deleteBulkMessages();
            });

            $('#bulkSendBtn').click(function() {
                showBulkSendModal();
            });

            $('#selectAll').click(function() {
                $('.messageCheckbox').prop('checked', this.checked);
            });
        });

        function loadReceivedMessages() {
            $.ajax({
                url: '/messenger/received',
                method: 'GET',
                success: function(data) {
                    $('#messageListTitle').text('받은 메신저함');
                    renderMessages(data);
                }
            });
        }

        function loadSentMessages() {
            $.ajax({
                url: '/messenger/sent',
                method: 'GET',
                success: function(data) {
                    $('#messageListTitle').text('보낸 메신저함');
                    renderMessages(data);
                }
            });
        }

        function renderMessages(messages) {
            var tbody = $('#messageTable tbody');
            tbody.empty();
            messages.forEach(function(message) {
                var tr = $('<tr></tr>');
                tr.append('<td><input type="checkbox" class="messageCheckbox" value="' + message.idMessenger + '"></td>');
                tr.append('<td>' + (message.senderLoginId || message.receiverLoginId) + '</td>');
                tr.append('<td><a href="/messenger/view?id=' + message.idMessenger + '" style="color: ' + (message.isRead ? 'black' : 'red') + '">' + message.subject + '</a></td>');
                tr.append('<td>' + message.messageText + '</td>');
                tr.append('<td>' + message.sentAt + '</td>');
                tr.append('<td>' + (message.isRead ? '읽음' : '읽지 않음') + '</td>');
                tr.append('<td><button onclick="replyMessage(' + message.idMessenger + ')">답장</button></td>');
                tr.append('<td><button onclick="updateMessage(' + message.idMessenger + ')">수정</button></td>');
                tr.append('<td><button onclick="deleteMessage(' + message.idMessenger + ')">삭제</button></td>');
                tbody.append(tr);
            });
        }

        function showCreateMessengerModal() {
            console.log('showCreateMessengerModal 호출됨');
            $('#modalTitle').text('쪽지 작성');
            $('#modalContent').load('/messenger/create', function(response, status, xhr) {
                if (status == "error") {
                    console.log("Error: " + xhr.status + ": " + xhr.statusText);
                    alert("쪽지 작성 페이지를 불러오는 데 실패했습니다.");
                } else {
                    console.log("쪽지 작성 페이지 로드 성공");
                    $('#modal').show();
                }
            });
        }

        function showBulkSendModal() {
            console.log('showBulkSendModal 호출됨');
            $('#modalTitle').text('대량 전송');
            $('#modalContent').load('/messenger/manySend', function(response, status, xhr) {
                if (status == "error") {
                    console.log("Error: " + xhr.status + ": " + xhr.statusText);
                    alert("대량 전송 페이지를 불러오는 데 실패했습니다.");
                } else {
                    console.log("대량 전송 페이지 로드 성공");
                    $('#modal').show();
                }
            });
        }

        function closeModal() {
            $('#modal').hide();

            var footerMenu = document.getElementById('footerMenu');
            if (footerMenu.style.display === 'block') {
                footerMenu.style.display = 'none';
            }
        }

        function replyMessage(id) {
            // 답장 로직 추가
        }

        function updateMessage(id) {
            var newText = prompt("메시지를 수정하세요:");
            if (newText) {
                $.ajax({
                    url: '/messenger/update',
                    method: 'POST',
                    data: { idMessenger: id, messageText: newText },
                    success: function() {
                        loadReceivedMessages();
                    }
                });
            }
        }

        function deleteMessage(id) {
            if (confirm("정말 삭제하시겠습니까?")) {
                $.ajax({
                    url: '/messenger/delete',
                    method: 'POST',
                    data: { idMessenger: id },
                    success: function() {
                        loadReceivedMessages();
                    }
                });
            }
        }

        function deleteBulkMessages() {
            var selectedIds = [];
            $('.messageCheckbox:checked').each(function() {
                selectedIds.push($(this).val());
            });

            if (selectedIds.length > 0) {
                if (confirm("정말 삭제하시겠습니까?")) {
                    $.ajax({
                        url: '/messenger/deleteBulk',
                        method: 'POST',
                        traditional: true,
                        data: { idMessengers: selectedIds },
                        success: function() {
                            loadReceivedMessages();
                        }
                    });
                }
            } else {
                alert("삭제할 메시지를 선택하세요.");
            }
        }
    </script>
</head>
<body>
<h2 id="messageListTitle">메신저함</h2>
<div class="btnArea">
    <button id="receivedBtn">받은 메신저함</button>
    <button id="sentBtn">보낸 메신저함</button>
    <button id="createBtn">쪽지 작성</button>
    <button id="bulkDeleteBtn">선택 삭제</button>
    <button id="bulkSendBtn">대량 전송</button>
</div>
<table id="messageTable" border="1">
    <thead>
    <tr>
        <th><input type="checkbox" id="selectAll"></th>
        <th>보낸/받은 사람</th>
        <th>제목</th>
        <th>내용</th>
        <th>보낸 시간</th>
        <th>읽음 여부</th>
        <th>답장</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>
    </thead>
    <tbody>
    <!-- 메시지 목록이 여기에 로드됩니다 -->
    </tbody>
</table>

<!-- 모달 창 -->
<div class="modal" id="modal">
    <div class="modal-header">
        <h2 id="modalTitle"></h2>
        <span class="modal-close" onclick="closeModal()">&times;</span>
    </div>
    <div class="modal-content" id="modalContent">
        <!-- 모달 내용이 여기에 표시됩니다. -->
    </div>
</div>
</body>
</html>
