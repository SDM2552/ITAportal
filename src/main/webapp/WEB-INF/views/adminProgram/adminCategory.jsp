<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
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
            background-color: #007bff;
            color: white;
        }

        .add-button {
            margin-left: 20px; /* Adjust the margin as needed */
            font-family: 'NotoKrD', dotum, '돋움', gulim, '굴림', Arial, AppleGothic, verdana, sans-serif, helvetica;
            margin: 0;
            padding: 0;
        }

        table {
            width: 80%; /* Set table to occupy full width */
            border-collapse: collapse;
        }


        .tblData {
            width: 80%; /* Ensure the container div is also full width */
        }

        .btns.btnSt01 {
            margin-left: 160px;
            color: white; /* 글자 색상 흰색으로 설정 */
            background-color: #005e93; /* 버튼 배경 색상 (예시) */
            border: none;
            padding: 8px;
            cursor: pointer;
            font-size: 13px;
        }
    </style>
    <script>
        function goToPage() {
            var page = document.getElementById('pageInput').value;
            var totalPages = ${totalPages};
            var keyword = '${keyword}';
            if (page < 1 || page > totalPages) {
                alert('잘못된 페이지 번호입니다.');
                return;
            }
            window.location.href = '/adminCategory?page=' + page + '&keyword=' + keyword;
        }
    </script>
    <title>교육과정관리</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_program.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i
                    class="fa-solid fa-angle-right"></i></span>
            <span class="on">강의 관리 <i class="fa-solid fa-angle-right"></i></span><span class="on"> 교육과정관리</span>
            <!-- //location -->

            <h3 class="pgTit">카테고리관리</h3>

            <!-- 본문 -->
            <h4 class="subTit">카테고리</h4>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="15%">
                        <col width="55%">
                        <col width="30%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">카테고리명</th>
                        <th scope="col">변경</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="category" items="${cate}">
                        <tr>
                            <td>${category.idCate}</td>
                            <td>${category.cateName}</td>
                            <td class="actions">
                                <a href="categoryUpdateInput?idCate=${category.idCate}"><button type="button">수정</button></a>
                                <a href="categoryDelete?idCate=${category.idCate}"><button type="button">삭제</button></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
            <!-- 페이징 네비게이션 -->
            <div class="pagination-wrapper">
                <div class="pagination">
                    <a href="/adminCategory?page=1&keyword=${keyword}">처음</a>
                    <c:if test="${currentPage > 1}">
                        <a href="?page=${currentPage - 1}">&laquo; 이전</a>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <a href="?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <a href="?page=${currentPage + 1}">다음 &raquo;</a>
                    </c:if>

                    <a href="/adminCategory?page=${totalPages}&keyword=${keyword}">끝</a>
                    <input type="number" id="pageInput" style="width: 50px;" min="1" max="${totalPages}" value="${currentPage}">
                    <button onclick="goToPage()">이동</button>
                </div>

                <a href="/categoryInput" class="add-button">
                    <button class="btns btnSt01">추가</button>
                </a>
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
