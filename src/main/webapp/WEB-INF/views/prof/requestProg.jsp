<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>

<%
    // 현재 날짜 가져오기
    Date now = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String formattedDate = sdf.format(now);
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>휴보강신청</title>
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
            <span>강의 관리 <i class="fa-solid fa-angle-right"></i> </span><span>내 강의 목록 <i class="fa-solid fa-angle-right"></i> </span>
            <span>${programInfo.pgmName} <i class="fa-solid fa-angle-right"></i></span><span class="on"> 휴보강 신청</span>
            <!-- //location -->
            <h3 class="pgTit">휴보강 신청</h3>
            <!-- 본문 -->
            <h4 class="subTit">프로그램 정보</h4>
            <!-- 강의 정보 테이블 -->
            <table class="tblData mt10">
                <colgroup>
                    <col style="width: 20%;">
                    <col style="width: 30%;">
                    <col style="width: 20%;">
                    <col style="width: 30%;">
                </colgroup>

                <tbody>
                <tr>
                    <th><label for="category">카테고리<br>(Category)</label></th>
                    <td><div id="category">${programInfo.cateName}</div></td>
                    <th><label for="pgmName">교과목명<br>(Program Title)</label></th>
                    <td><div id="pgmName">${programInfo.pgmName}</div></td>
                </tr>
                <tr>
                    <th><label for="classRoom">수업시간/강의실<br>(Class Time/Class Room)</label></th>
                    <td><div id="classRoom">${programInfo.roomName}</div></td>
                    <th><label for="programDuration">강의기간<br>(Program Duration)</label></th>
                    <td><div id="programDuration">${programInfo.stDt} ~ ${programInfo.endDt}</div></td>
                </tr>
                </tbody>
            </table><br>
            <h4 class="subTit">휴보강 신청</h4>
            <div class="tblData mt10">
                <form id="classRequestForm" method="post" action="/prof/classRequest">
                <table>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tbody class="mid">
                    <tr>
                        <th scope="col">강의 주차</th>
                        <td><select id="schedNo" name="schedNo" onchange="idshcedChange(this.value, ${programInfo.idPgm})">
                            <option value="" selected disabled hidden>선택</option>
                            <c:forEach var="i" begin="1" end="${maxIdSched}">
                                <option value="${i}">${i}</option>
                            </c:forEach>
                        </select></td>
                    </tr>
                    <tr>
                        <th scope="col">기존 강의 일자</th>
                        <td><div id="classDateForm" name="classDateForm"></div>
                            <input type="hidden" id="classDate" name="classDate" value=""></td>
                        <th scope="col">기존 강의실</th>
                        <td>
                            <input type="text" value="${programInfo.roomName}" readonly style="width: 100%;">
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">보강 일자</th>
                        <td>
                            <input type="date" name="makeUpDate" style="width: 100%;">
                        </td>
                        <th scope="col">보강 강의실</th>
                        <td><select id="idRoom" name="idRoom" style="width: 100%;">
                            <option value="" selected disabled hidden>선택</option>
                            <c:forEach var="room" items="${classRoom}">
                            <option value="${room.idRoom}">${room.roomName}</option></c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">휴강 사유</th>
                        <td colspan="3">
                            <textarea name="remarks" placeholder="내용을 입력하세요."></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">신청 일시</th>
                        <td><%= formattedDate %>
                        </td>
                        <th scope="col">진행 상태</th>
                        <td>
                        </td>
                    </tr>
                    <input type="hidden" name="idProf" value="${programInfo.idProf}">
                    <input type="hidden" name="idPgm" value="${programInfo.idPgm}">
                    <input type="hidden" name="idSched" value="" id="idSched">
                    </tbody>
                </table>
                </form>
            </div>
            <!-- btn -->
            <div class="btnArea">
                <button type="submit" class="btns btnSt01" onclick="submitForm()">
                    <span>신청</span>
                </button>
                <button type="button" class="btns btnSt02" onclick="history.back();">
                    <span>목록으로</span>
                </button>
            </div>
            <!-- btn -->
            <br>


            <h4 class="subTit">강의 휴보강 이력</h4>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="15%">
                        <col width="15%">
                        <col width="25%">
                        <col width="25%">
                        <col width="25%">
                        <col width="15%">

                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">휴강일자</th>
                        <th scope="col">보강일자</th>
                        <th scope="col">보강강의실</th>
                        <th scope="col">보강사유</th>
                        <th scope="col">승인시간</th>
                        <th scope="col">신청취소</th>
                    </tr>
                    </thead>
                    <c:choose>
                        <c:when test="${empty classRequest}">
                            <tr>
                                <td colspan="6" style="text-align: center;">휴보강 이력이 없습니다</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="classReq" items="${classRequest}">
                                <tr>
                                    <td>${classReq.classDate}</td>
                                    <td>${classReq.makeUpDate}</td>
                                    <td>${classReq.roomName}</td>
                                    <td>${classReq.remarks}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${classReq.procDate == null}">
                                                <span>처리중</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span>승인 (${classReq.procDate})</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${classReq.procDate == null}">
                                                <button class="s1" style="background-color: #555555" onclick="cancelRequest(${classReq.idClassRequest})">취소</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="button" class="s1" disabled>처리완료</button>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
            </div>


            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>
<script>
    function idshcedChange(schedNo, idPgm) {
        $.ajax({
            url: '/prof/getDaySched',
            type: 'POST',
            data: {
                schedNo: schedNo,
                idPgm: idPgm
            },
            success: function(sched) {
                if(!sched.daySched){
                    alert('강의 날짜가 입력되지 않았습니다. 주차별 강의계획을 먼저 입력해주세요.')
                }
                $('#classDateForm').text(sched.daySched);
                $('#classDate').val(sched.daySched);
                $('#idSched').val(sched.idSched);
            },
            error: function(request, status, error) {
                console.error("Error: ", error);
            }
        });
    }

    function submitForm() {
        if (confirm('휴(보)강을 신청하시겠습니까?')) {
            document.getElementById('classRequestForm').submit();
            alert('신청되었습니다.');
        }
    }

    function cancelRequest(idClassRequest) {
        if (confirm('신청을 취소하시겠습니까?')) {
            // $.ajax({
            //     url: '/request/cancel',
            //     type: 'POST',
            //     data: { id: id },
            //     success: function(response) {
            //         alert('신청이 취소되었습니다.');
            //         location.reload();
            //     },
            //     error: function(error) {
            //         alert('신청 취소 중 오류가 발생했습니다.');
            //     }
            // });
        }
    }


</script>


</body>

</html>