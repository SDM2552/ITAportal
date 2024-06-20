<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/table.css'/>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .btnArea {
            text-align: right;
            margin-top: 1px;
        }

        .btnArea button {
            margin-left: 10px;
        }

        .pagination-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .pagination {
            display: flex;
            align-items: center;
            margin: 0 20px; /* Center the pagination */
        }

        .pagination a {
            display: inline-block;
            margin: 0 5px;
            padding: 5px 10px;
            border: 1px solid #ddd;
            color: #333;
            text-decoration: none;
        }

        .pagination a.active {
            background-color: #123867;
            color: white;
        }

        .add-button {
            margin-left: 20px; /* Adjust the margin as needed */
            font-family: 'NotoKrD', dotum, '돋움', gulim, '굴림', Arial, AppleGothic, verdana, sans-serif, helvetica;

            margin: 0;
            padding: 0;
        }

        .btns.btnSt01 {
            margin-left: 5px;
            color: white; /* 글자 색상 흰색으로 설정 */
            background-color: #123867; /* 버튼 배경 색상 (예시) */
            border: 1px solid #000000; /* 검정색 테두리 추가 */
            padding: 4px;
            cursor: pointer;
            font-size: 13px;
        }

    </style>
    <title>휴보강신청 현황 조회</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_request.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i
                    class="fa-solid fa-angle-right"></i></span>
            <span class="on">신청 관리 <i class="fa-solid fa-angle-right"></i></span><span class="on"> 휴보강신청 현황 조회</span>
            <!-- //location -->

            <h3 class="pgTit">휴보강신청 현황 조회</h3>

            <!-- 본문 -->
            <h4 class="subTit">휴/보강 신청 현황</h4>
            <div class="btnArea">
                <form action="#" method="get">
                    <input type="text" title="키워드 입력" placeholder="프로그램명 검색" id="proTitleSel" name="keyword" value="${keyword}"/>
                    <button type="submit" class="btn_search">검색</button>
                </form>
            </div>
            <div>
                <table class="tblData mt10">
                    <colgroup>
                        <col width="12%">
                        <col width="8%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="15%">
                        <col width="10%">
                        <col width="8%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">개설강좌명</th>
                        <th scope="col">강사명</th>
                        <th scope="col">휴강일자</th>
                        <th scope="col">보강일자</th>
                        <th scope="col">보강강의실</th>
                        <th scope="col">휴보강사유</th>
                        <th scope="col">진행상태</th>
                        <th scope="col">처리</th>
                    </tr>
                    </thead>
                    <c:choose>
                        <c:when test="${empty classReq}">
                            <tr>
                                <td colspan="7" style="text-align: center;">휴보강 신청내용이 없습니다</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="classReq" items="${classReq}">
                                <tr>
                                    <td>${classReq.pgmName}</td>
                                    <td>${classReq.name}</td>
                                    <td>${classReq.classDate}</td>
                                    <td>${classReq.makeUpDate}</td>
                                    <td>${classReq.roomName}</td>
                                    <td>${classReq.remarks}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${classReq.procDate == null}">
                                                <span>미승인</span>
                                            </c:when>
                                            <c:when test="${classReq.procDate == 'reject'}">
                                                <span>반려</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span>승인 (${classReq.procDate})</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${classReq.procDate == null}">
                                                <button type="button" class="miniBtn blueC" onclick="approveReq(${classReq.idClassRequest})" style="margin-right: 1px">승인</button>
                                                <button type="button" class="miniBtn redC" onclick="rejectReq(${classReq.idClassRequest})" style="margin-left: 1px">반려</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="button" class="s1" disabled>처리완료</button>
                                            </c:otherwise>
                                        </c:choose>  </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
            </div>

            <!-- 본문 끝 -->

        </div>
        <!-- //contents -->
    </div><br><br><br>
    <!-- footer -->
    <c:import url="../layout/footer.jsp"/>
</div>
<script>
    function approveReq(idClassRequest){
        if(confirm('승인 처리 하시겠습니까?')) {
            $.ajax({
                url: '/admin/classReqOk',
                type: 'POST',
                data: {
                    idClassRequest: idClassRequest
                },
                success: function (response) {
                    alert(response);
                    location.reload();
                },
                error: function (xhr, status, error) {
                    alert("에러가 발생했습니다: " + xhr.responseText);
                }
            });
        }
    }

    function rejectReq(idClassRequest){
        if(confirm('반려 처리 하시겠습니까?')) {
            $.ajax({
                url: '/admin/classReqNo',
                type: 'POST',
                data: {
                    idClassRequest: idClassRequest
                },
                success: function (response) {
                    alert(response);
                    location.reload();
                },
                error: function (xhr, status, error) {
                    alert("에러가 발생했습니다: " + xhr.responseText);
                }
            });
        }
    }
</script>

</body>

</html>




