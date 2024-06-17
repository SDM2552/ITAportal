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
                <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
                <span>수업 <i class="fa-solid fa-angle-right"></i> </span><span>나의 강의실 <i class="fa-solid fa-angle-right"></i> </span>
                <span>${program.pgmName} </span>
            </div>
            <h3 class="pgTit">프로그램 정보</h3>
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
                        <td colspan="3">${program.pgmFee}</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <h3 class="pgTit">강의계획서</h3>
            <div class="tblData mt10" id="syllabus">
                <table>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="col">강의방식</th>
                        <td>${syllabus.teaching}</td>
                        <th scope="col">교재 및 참고자료</th>
                        <td>${syllabus.book}</td>
                    </tr>
                    <tr>
                        <th scope="col">교과목 개요</th>
                        <td colspan="3">${syllabus.courseOverview}</td>
                    </tr>
                    <tr>
                        <th scope="col">수업 목표</th>
                        <td colspan="3">${syllabus.objective}</td>
                    </tr>
                    <tr>
                        <th scope="col">평가 방법</th>
                        <td colspan="3">${syllabus.evaluation}</td>
                    </tr>                    <tr>
                        <th scope="col">비고</th>
                        <td colspan="3">${syllabus.remarks}</td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="btnArea">
            <button type="button" class="btns btnSt02" onclick="history.back();">
                <span>목록으로</span>
            </button>
        </div>
        </div>
    </div>
    <c:import url="../layout/footer.jsp"/>
</div>
</body>
</html>
