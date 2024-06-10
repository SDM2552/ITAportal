<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="ko">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>카카오톡 메시지 전송</title>--%>
<%--    <link rel="stylesheet" type="text/css" href="/css/common.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="/css/table.css">--%>
<%--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h3 class="pgTit">카카오톡 메시지 전송</h3>--%>
<%--<h4 class="subTit">메시지 작성</h4>--%>
<%--<form id="kakaoForm">--%>
<%--    <div class="tblData mt10">--%>
<%--        <table>--%>
<%--            <tbody class="mid">--%>
<%--            <tr>--%>
<%--                <th scope="col">카카오 ID</th>--%>
<%--                <td colspan="3">--%>
<%--                    <input type="text" placeholder="카카오 ID를 입력하세요." id="kakaoId" name="kakaoId" class="input-field"/>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th scope="col">메시지</th>--%>
<%--                <td colspan="3">--%>
<%--                    <textarea placeholder="메시지를 입력하세요." id="message" name="message" class="textarea-field"></textarea>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--    <div class="btnArea">--%>
<%--        <button type="button" class="button" onclick="sendKakaoForm()">--%>
<%--            <span>전송</span>--%>
<%--        </button>--%>
<%--        <button type="button" class="button" onclick="closeModal()">--%>
<%--            <span>취소</span>--%>
<%--        </button>--%>
<%--    </div>--%>
<%--</form>--%>
<%--<script>--%>
<%--    function sendKakaoForm() {--%>
<%--        var kakaoId = $('#kakaoId').val();--%>
<%--        var message = $('#message').val();--%>

<%--        $.ajax({--%>
<%--            url: '/kakao/send',--%>
<%--            method: 'POST',--%>
<%--            contentType: 'application/json',--%>
<%--            data: JSON.stringify({ kakaoId: kakaoId, message: message }),--%>
<%--            success: function(response) {--%>
<%--                alert('메시지가 전송되었습니다.');--%>
<%--                closeModal();--%>
<%--            },--%>
<%--            error: function(xhr, status, error) {--%>
<%--                alert('메시지 전송에 실패했습니다: ' + xhr.responseText);--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>

<%--    function closeModal() {--%>
<%--        var modal = parent.document.getElementById('modal');--%>
<%--        modal.style.display = 'none';--%>
<%--    }--%>

<%--    $(document).ready(function() {--%>
<%--        $('#kakaoButton').on('click', function() {--%>
<%--            $('#modalTitle').text('카카오톡 메시지 전송');--%>
<%--            $('#modalContent').load('/kakao/form', function(response, status, xhr) {--%>
<%--                if (status == "error") {--%>
<%--                    alert("카카오톡 폼을 불러오는 데 실패했습니다.");--%>
<%--                } else {--%>
<%--                    $('#modal').show();--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>
