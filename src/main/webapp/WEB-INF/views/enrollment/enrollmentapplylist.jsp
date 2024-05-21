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
    <title>수강내역목록</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_student.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동></span>
                <span>수업></span>
                <span class="on">수강 내역 조회</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>수강 내역 조회</h3>

            <!-- 본문 -->
            <h4 class="subTit">수강 내역 조회</h4>
            <div class="tblData mt10">
                <table>
                    <thead>
                    <tr>
                        <th scope="col">분류</th>
                        <th scope="col">프로그램명</th>
                        <th scope="col">교육 기간</th>
                        <th scope="col">신청일</th>
                        <th scope="col">수강료</th>
                        <th scope="col">수강 상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty sugangList}">
                            <tr>
                                <td colspan="7">수강 내역이 없습니다</td> <!-- 관리자만 보이는 상태 변경 칸 추가로 colspan=7 -->
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="sugang" items="${sugangList}">
                                <tr>
                                    <td>${sugang.cateName}</td>
                                    <td>${sugang.pgmName}</td>
                                    <td>${sugang.stDt} ~ <br>${sugang.endDt}</td>
                                    <td>${sugang.sugangStDt}</td>
                                    <td>${sugang.pgmFee} 원</td>
                                    <td>${sugang.status}</td>
                                        <%-- 신청상태버튼 - 관리자만 --%>
                                    <td>
                                        <c:choose>
                                            <c:when test="${sessionScope.loginUser.role eq 'admin'}">
                                                <form action="/enrollment/updateStatus" method="post">
                                                    <input type="hidden" name="idEnrollment" value="${sugang.idEnrollment}">
                                                    <select name="status">
                                                        <option value="신청중" <c:if test="${sugang.status == '신청중'}">selected</c:if>>신청중</option>
                                                        <option value="신청대기" <c:if test="${sugang.status == '신청대기'}">selected</c:if>>신청대기</option>
                                                        <option value="신청완료" <c:if test="${sugang.status == '신청완료'}">selected</c:if>>신청완료</option>
                                                        <option value="신청취소" <c:if test="${sugang.status == '신청취소'}">selected</c:if>>신청취소</option>
                                                    </select>
                                                    <button type="submit">변경</button>
                                                </form>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
            <!-- 본문 끝 -->
        </div>
            <!-- //contents -->

    </div>
        <!-- footer -->
        <c:import url="../layout/footer.jsp"/>

</div>
</body>

</html>