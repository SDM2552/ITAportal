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
                        <th scope="col">강사</th>
                        <td>${program.profName}</td>
                        <th scope="col">교육 기간</th>
                        <td>${program.stDt} ~ ${program.endDt}</td>
                    </tr>
                    <tr>
                        <th scope="col">교육 대상</th>
                        <td>${program.pgmTarget}</td>
                        <th scope="col">강의실</th>
                        <td>${program.roomName}</td>
                    </tr>
                    <tr>
                        <th scope="col">강의 구분</th>
                        <td>${program.pgmMethod}</td>
                        <th scope="col">교육 인원</th>
                        <td>${program.pgmPer}</td>
                    </tr>
                    </tbody>
                </table>
            </div><br><br>

                <h4 class="subTit">강의계획서</h4>
                <!-- 강의 정보 테이블 -->
                <table class="tblData mt10">
                    <colgroup>
                        <col style="width: 30%;">
                        <col style="width: 70%;">
                    </colgroup>

                    <tbody>
                    <tr>
                        <th><label for="category">강의 개요</label></th>
                        <td><div id="category">${syllabus.courseOverview}</div></td>
                    </tr>
                    <tr>
                        <th><label for="pgmName">교재 및 참고자료</label></th>
                        <td><div id="pgmName">${syllabus.book}</div></td>
                    </tr>
                    <tr>
                        <th><label for="objective">수업 목표</label></th>
                        <td><div id="objective">${syllabus.objective}</div></td>
                    </tr>
                    <tr>
                        <th><label for="evaluation">평가 방법</label></th>
                        <td><div id="evaluation">${syllabus.evaluation}</div></td>
                    </tr>
                    <tr>
                        <th><label for="remarks">비고</label></th>
                        <td><div id="remarks">${syllabus.remarks}</div></td>
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

            <h3 class="pgTit">주차별 강의계획</h3>
            <div class="tblData mt10" id="schedule">
                <table>
                    <colgroup>
                        <col width="5%">
                        <col width="15%">
                        <col width="15%">
                        <col width="25%">
                        <col width="25%">
                        <col width="20%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">수업주차</th>
                        <th scope="col">수업일자</th>
                        <th scope="col">수업시간</th>
                        <th scope="col">수업내용</th>
                        <th scope="col">수업방법</th>
                        <th scope="col">비고</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="schedule" items="#{schedules}">
                        <tr>
                            <td>
                                <span class="schedNo">${schedule.schedNo}</span>
                            </td>
                            <td>
                                <span class="daySched">${schedule.daySched}</span>
                            </td>
                            <td>
                                <span class="pgmTime">${schedule.pgmTime}</span>
                            </td>
                            <td>
                                <span class="learningContents">${schedule.learningContents}</span>
                            </td>
                            <td>
                                <span class="learningDetail">${schedule.learningDetail}</span>
                            </td>
                            <td>
                                <span class="note">${schedule.note}</span>
                            </td>
                            <input type="hidden" class="idSched" value="${schedule.idSched}">
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="btnArea">
            <button type="button" class="btns btnSt02" onclick="history.back();">
                <span>목록으로</span>
            </button>
            <button type="button" class="btns btnSt02">
                <span>주차별 강의계획</span>
            </button>
            </div>
        </div>
    </div>
    <c:import url="../layout/footer.jsp"/>
</div>
</body>
</html>
