<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
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
        <c:import url="../layout/nav_sugang.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동</span>
                <span>수강 내역 조회</span>
                <span class="on">수강 내역</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>수강 신청</h3>

            <!-- 본문 -->
            <form name="frm" id="frm" method="post">
                <div class="boardSearch_g type">
                    <span class="tit">강좌구분 </span>
                    <select title="선택" id="lecIdxSel" name="lecIdxSel">
                        <option value="">전체</option>
                        <option value="1">실무능력강화프로그램</option>
                        <option value="2">신(新)문해프로그램</option>
                        <option value="3">문화공감프로그램</option>
                        <option value="4">신(新)중년맞춤프로그램</option>
                        <option value="5">4차산업혁명 프로그램</option>
                        <option value="6">지역사회 공헌 자율과제</option>
                    </select>
                    <span class="tit">프로그램명</span>
                    <input type="text" title="키워드 입력" placeholder="프로그램명을 입력하세요" id="proTitleSel" name="proTitleSel"
                           value="" />
                    <button class="btn_search">검색</button>
                </div>
                <div class="tblData mt10">
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="30%">
                            <col width="30%">
                            <col width="20%">
                            <col width="10%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">프로그램명</th>
                            <th scope="col">교육 기간</th>
                            <th scope="col">수강신청 기간</th>
                            <th scope="col">수강신청</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>2</td>
                            <td>자유무역</td>
                            <td>2024-11-09 ~ 2024-11-10</td>
                            <td>2024-04-15 09:00<br>
                                2024-11-01 18:00
                            </td>
                            <td>
                                <button type="button" onclick="window.location.href = '/program/applyForm';">수강신청</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
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