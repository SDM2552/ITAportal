<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css?ver=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css?ver=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>공지사항 수정</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_notice.jsp"/>
        <!-- contents -->
        <div id="contents" class="noticesListCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span>공지사항 <i class="fa-solid fa-angle-right"></i></span><span class="on"> 공지사항 수정</span>
            <!-- //location -->

            <h3 class="pgTit">공지사항 수정</h3>

            <!-- 본문 -->
            <h4 class="subTit">공지사항 수정</h4>

            <form action="/notice/edit" method="post">
                <input type="hidden" id="idNotice" name="idNotice" value="${notice.idNotice}"/>
                <div class="tblData mt10">
                    <table>
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tbody class="mid">
                        <tr>
                            <th scope="col">제목</th>
                            <td colspan="3">
                                <input type="text" placeholder="제목을 입력하세요." id="title" name="title" value="${notice.title}"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">내용</th>
                            <td colspan="3">
                                <textarea placeholder="내용을 입력하세요." id="content" name="content">${notice.content}</textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="btnArea">
                    <button type="submit" class="btns btnSt01">
                        <span>저장</span>
                    </button>
                    <button type="button" class="btns btnSt02" onclick="history.back();">
                        <span>목록으로</span>
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