<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>강사 정보</title>
</head>
<body>
<div class="wrap">
    <c:import url="../layout/header.jsp"/>
    <div id="container" class="container responCont">
        <c:import url="../layout/nav_student.jsp"/>
        <div id="contents" class="eduIntroCont">
            <div class="location">
                <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
                <span>강사 정보 <i class="fa-solid fa-angle-right"></i></span>
            </div>
            <h3 class="pgTit">강사 정보</h3>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="30%">
                        <col width="30%">
                        <col width="30%">

                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">강사명</th>
                        <th scope="col">전화번호</th>
                        <th scope="col">이메일</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>최교수</td>
                            <td>010-1234-1234</td>
                            <td>choiprof@email.com</td>
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
