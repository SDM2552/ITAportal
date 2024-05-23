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
    <title>프로그램 정보</title>
</head>
<body>
<div class="wrap">
    <c:import url="../layout/header.jsp"/>
    <div id="container" class="container responCont">
        <c:import url="../layout/nav_student.jsp"/>
        <div id="contents" class="eduIntroCont">
            <div class="location">
                <span class="home" title="홈">홈으로 이동</span>
                <span>프로그램 정보</span>
            </div>
            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>프로그램 정보</h3>
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
                        <th scope="col">분류</th>
                        <td>${program.cateName}</td>
                        <th scope="col">프로그램명</th>
                        <td>${program.pgmName}</td>
                    </tr>
                    <tr>
                        <th scope="col">교육 기간</th>
                        <td>${program.stDt} ~ ${program.endDt}</td>
                        <th scope="col">접수 기간</th>
                        <td>${program.sugangStDt} ~ ${program.sugangEndDt}</td>
                    </tr>
                    <tr>
                        <th scope="col">교육 대상</th>
                        <td>${program.pgmTarget}</td>
                        <th scope="col">교육 방법</th>
                        <td>${program.pgmMethod}</td>
                    </tr>
                    <tr>
                        <th scope="col">교육 인원</th>
                        <td>${program.pgmPer}</td>
                        <th scope="col">수강 인원</th>
                        <td>${program.numOfStu}</td>
                    </tr>
                    <tr>
                        <th scope="col">교육비</th>
                        <td colspan="3">${program.pgmFee}원</td>
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
