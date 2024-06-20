<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Q&A</title>
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/checkSession.js" defer></script>


</head>
<body>
<div class="wrap">
    <c:import url="../layout/header.jsp" />

    <div id="container" class="container responCont">
        <c:import url="../layout/nav_admin_notice.jsp" />
        <div id="contents" class="noticesListCont">
            <div class="location">
                <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
                <span class="on">Q&A</span>
            </div>

            <h3 class="pgTit">Q&A</h3>

            <div class="btnArea">
                <form action="" method="get">
                    <input type="text" title="키워드 입력" placeholder="검색어 입력" id="proTitleSel" name="keyword" value="${keyword}"/>
                    <button type="submit" class="btn_search">검색</button>
                </form>
            </div>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="10%">
                        <col width="70%">
                        <col width="20%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>글 번호</th>
                        <th>제목</th>
                        <th>등록일</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td colspan="4"><div class="non-page board">
                                <h3>
                                    작성된 게시물이 없습니다.</h3>
                            </div></td>
                        </tr>

                    </tbody>
                </table>
            </div>


        </div>
    </div>

    <c:import url="../layout/footer.jsp"/>
</div>
</body>
</html>
