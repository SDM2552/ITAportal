<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>강의실수정</title>
    <style>
        th, td {
            white-space: nowrap;
        }
        th {
            width: 120px; /* 제목 칸의 너비를 고정 */
        }
    </style>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_program.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span>강의 관리 <i class="fa-solid fa-angle-right"></i></span><span class="on"> 강의실 수정</span>
            <!-- //location -->

            <h3 class="pgTit">강의실 관리</h3>

            <!-- 본문 -->
            <h4 class="subTit">강의실 수정</h4>
            <form id="progInputForm" method="post" action="/classRoomUpdate">
                <div class="tblData mt10" style="width: 80%">
                    <table>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tbody class="mid">
                        <tr>
                            <th scope="col">강의실명</th>
                            <td colspan="3">
                                <input type="text"  id="roomName" placeholder="강의실명 입력" value="${cr.roomName}" name="roomName">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <input type="hidden" name="idRoom" value="${cr.idRoom}">
                <div class="btnArea"style="width: 80%">
                    <button type="submit" class="btns btnSt01">
                        <span>제출</span>
                    </button>
                    <button type="button" class="btns btnSt02" onclick="history.back();">
                        <span>취소</span>
                    </button>
                </div>
            </form>
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>
</body>
</html>
