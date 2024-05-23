<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>카테고리 검색</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            box-sizing: border-box;
        }

        .container {
            width: 100%;
            max-width: 800px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            background-color: #fff;
        }

        .tblData {
            width: 100%;
            margin-top: 10px;
        }

        .tblData table {
            width: 100%;
            border-collapse: collapse;
        }

        .tblData th, .tblData td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .tblData th {
            background-color: #f4f4f4;
        }
    </style>
    <script>
        function selectCategory(idCate, cateName) {
            window.opener.document.getElementById('idCate').value = cateName;
            window.opener.document.getElementById('idCate').value = idCate;
            window.opener.document.getElementById('cateName').value = idCate;
            window.opener.document.getElementById('cateName').value = cateName;
            window.close();
        }
    </script>
</head>
<body>
<div class="container">
    <div><h4 class="subTit">카테고리<br>클릭해서 선택</h4></div>

    <div class="tblData">
        <table>
            <colgroup>
                <col width="30%">
                <col width="70%">
            </colgroup>
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">카테고리명</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="ct" items="${cate}">
                <tr onclick="selectCategory('${ct.idCate}', '${ct.cateName}')">
                    <td>${ct.idCate}</td>
                    <td>${ct.cateName}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
