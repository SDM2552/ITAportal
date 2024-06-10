<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>카카오톡 메시지 전송</title>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_notice.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span class="on"> 카카오톡 메시지 전송</span>
            <!-- //location -->

            <h3 class="pgTit">카카오톡 메시지 전송</h3>

            <!-- 본문 -->
            <h4 class="subTit">메시지 작성</h4>
            <form action="/kakao/send" method="post">
                <div class="tblData mt10">
                    <table>
                        <tbody class="mid">
                        <tr>
                            <th scope="col">카카오 ID</th>
                            <td colspan="3">
                                <input type="text" placeholder="카카오 ID를 입력하세요." id="kakaoId" name="kakaoId" class="input-field"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">메시지</th>
                            <td colspan="3">
                                <textarea placeholder="메시지를 입력하세요." id="message" name="message" class="textarea-field"></textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="btnArea">
                    <button type="submit" class="button">
                        <span>전송</span>
                    </button>
                    <button type="button" class="button" onclick="history.back();">
                        <span>취소</span>
                    </button>
                </div>
            </form>
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp"/>
</div>
</body>
</html>
