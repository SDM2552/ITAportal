<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>샘플 페이지</title>
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
            <div class="location">
                <span class="home" title="홈">홈으로 이동></span>
                <span>관리자 페이지></span>
                <span class="on">공지사항</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>공지사항</h3>

            <!-- 본문 -->
            <h4 class="subTit">공지사항 작성</h4>

            <form action="/notice/save" method="post">
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
                            <input type="text" placeholder="제목을 입력하세요."id="title" name="title" value="${notice.title}"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">내용</th>
                        <td colspan="3">
                            <textarea placeholder="내용을 입력하세요."id="content" name="content">${notice.content}</textarea>
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



            <a href="/notice/noticeList">목록으로 돌아가기</a>

            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp"/>
</div>
</body>
</html>
