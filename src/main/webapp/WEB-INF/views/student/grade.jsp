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
    <title>성적 조회</title>
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
                <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
                <span>수업 <i class="fa-solid fa-angle-right"></i> </span><span class="on">나의 강의실 </span>
            </div>
            <!-- //location -->

            <h3 class="pgTit">성적 조회</h3>

            <!-- 본문 -->
            <h4 class="subTit">수강 과목 성적</h4>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="15%">
                        <col width="30%">
                        <col width="15%">
                        <col width="10%">
                        <col width="15%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">분류</th>
                        <th scope="col">강의명</th>
                        <th scope="col">담당 강사</th>
                        <th scope="col">출석 점수</th>
                        <th scope="col">과제 점수</th>
                        <th scope="col">통합 성적</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:choose>
                        <c:when test="${empty sugangList}">
                            <tr>
                                <td colspan="6">수강 중인 강좌가 없습니다</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
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
<script>
    function cancelEnrollment(idPgm) {
        if (confirm('정말로 수강을 취소하시겠습니까?')) {
            fetch('/program/cancelSugang', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    idPgm: idPgm
                })
            })
                .then(response => response.text())
                .then(data => {
                    alert(data);
                    // 수강 취소 후 페이지를 새로고침하거나 다른 동작을 수행할 수 있음
                    location.reload();
                })
                .catch(error => {
                    alert('수강 취소에 실패했습니다.');
                    console.error('Error:', error);
                });
        }
    }



</script>
</body>
</html>