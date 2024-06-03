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

            $('#savedBtn').click(function() {
                loadSavedMessages();
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
                    renderMessages(data, 'received');
                }
            });
        }

        function loadSentMessages() {
            $.ajax({
                url: '/messenger/sent',
                method: 'GET',
                success: function(data) {
                    $('#messageListTitle').text('보낸 메신저함');
                    renderMessages(data, 'sent');
                }
            });
        }

        function loadSavedMessages() {
            $.ajax({
                url: '/messenger/saved',
                method: 'GET',
                success: function(data) {
                    $('#messageListTitle').text('임시 저장함');
                    renderMessages(data, 'saved');
                }
            });
        }

        function renderMessages(messages, type) {
            var tbody = $('#messageTable tbody');
            tbody.empty();
            messages.forEach(function(messenger) {
                var readStatus = (type === 'received') ? messenger.messengerRead : messenger.receiverRead;
                var tr = $('<tr></tr>');
                tr.append('<td><input type="checkbox" class="messageCheckbox" value="' + messenger.idMessenger + '"></td>');
                tr.append('<td>' + (type === 'sent' || type === 'saved' ? messenger.receiverLoginId : messenger.senderLoginId) + '</td>');
                tr.append('<td><a href="/messenger/view?idMessenger=' + messenger.idMessenger + '" style="color: ' + (readStatus ? 'black' : 'red') + '">' + messenger.subject + '</a></td>');
                tr.append('<td>' + messenger.messageText + '</td>');
                tr.append('<td>' + messenger.sentAt + '</td>');
                tr.append('<td>' + (readStatus ? '읽음' : '읽지 않음') + '</td>');
                tr.append('<td><button onclick="replyMessage(' + messenger.idMessenger + ')">답장</button></td>');
                tr.append('<td><button onclick="updateMessage(' + messenger.idMessenger + ')">수정</button></td>');
                tr.append('<td><button onclick="deleteMessage(' + messenger.idMessenger + ')">삭제</button></td>');
                tbody.append(tr);
            });
        }

        function showCreateMessengerModal() {
            $('#modalTitle').text('쪽지 작성');
            $('#modalContent').load('/messenger/create', function(response, status, xhr) {
                if (status == "error") {
                    alert("쪽지 작성 페이지를 불러오는 데 실패했습니다.");
                } else {
                    $('#modal').show();
                }
            });
        }

        function showBulkSendModal() {
            $('#modalTitle').text('대량 전송');
            $('#modalContent').load('/messenger/manySend', function(response, status, xhr) {
                if (status == "error") {
                    alert("대량 전송 페이지를 불러오는 데 실패했습니다.");
                } else {
                    $('#modal').show();
                }
            });
        }

        function closeModal() {
            $('#modal').hide();
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

        function sendMessenger() {
            var form = $('#createMessengerForm');
            $.ajax({
                url: '/messenger/send',
                method: 'POST',
                data: form.serialize(),
                success: function(response) {
                    alert('쪽지가 전송되었습니다.');
                    $('#modal').hide();
                    loadMessengerList();
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
                    loadMessengerList();
                },
                error: function(xhr, status, error) {
                    alert('쪽지 저장에 실패했습니다: ' + xhr.responseText);
                }
            });
        }

        function cancelCreateMessenger() {
            $('#modal').hide();
            loadMessengerList();
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

        function sendMessage(idMessenger) {
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

        function sendMessage(idMessenger) {
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


    </script>
</head>
<body>
<h2 id="messageListTitle">메신저함</h2>
<div class="btnArea">
    <button id="receivedBtn">받은 메신저함</button>
    <button id="sentBtn">보낸 메신저함</button>
    <button id="savedBtn">임시 저장함</button>
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
