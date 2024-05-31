<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>샘플 페이지</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_prof_program.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span>강의 관리 <i class="fa-solid fa-angle-right"></i> </span><span>과제 관리 <i class="fa-solid fa-angle-right"></i> </span>
            <span>프로그램 정보 <i class="fa-solid fa-angle-right"></i></span><span class="on"> 과제 상세</span>
            <!-- //location -->

            <h3 class="pgTit">과제 관리</h3>

            <!-- 본문 -->
            <h4 class="subTit">과제 상세</h4>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="col">강좌명</th>
                        <td colspan="3">
                            ${examDetail.programName}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">과제명</th>
                        <td colspan="3">
                            ${examDetail.name}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">과제 내용</th>
                        <td colspan="3">
                            ${examDetail.description}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">과제 시작일</th>
                        <td>
                            ${examDetail.startDate}
                        </td>
                        <th scope="col">과제 마감일</th>
                        <td>
                            ${examDetail.endDate}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">진행 상태</th>
                        <td>
                            ${examDetail.status}
                        </td>
                        <th scope="col">제출 인원</th>
                        <td>
                            ${examDetail.count}/10명
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!-- btn -->
            <div class="btnArea">
                <button type="submit" class="btns btnSt01">
                    <span>수정</span>
                </button>
                <button type="button" class="btns btnSt02" onclick="history.back();">
                    <span>목록으로</span>
                </button>
            </div>
            <!-- btn -->
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>
</body>

</html>