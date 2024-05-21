<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>강의관리</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="/WEB-INF/views/layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="/WEB-INF/views/layout/nav_prof_program.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동 </span>
                <span class="on">강의 관리</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>강의 관리</h3>

            <!-- 본문 -->
            <h4 class="subTit">프로그램 정보</h4>
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
                        <td colspan="3">
                            ${ProgramDetail.cateName}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">프로그램명</th>
                        <td colspan="3">
                            ${ProgramDetail.pgmName}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">교육기간</th>
                        <td>
                            ${ProgramDetail.stDt} ~ ${ProgramDetail.endDt}
                        </td>
                        <th scope="col">강의 요일/시간</th>
                        <td>
                            토,일/09:00~18:00(수정해야함)
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">수강 인원</th>
                        <td>
                            ${ProgramDetail.numOfStu}/${ProgramDetail.pgmPer} 명
                        </td>
                        <th scope="col">교육 장소</th>
                        <td>
                            ${ProgramDetail.roomName}
                        </td>
                    </tr>


                    </tbody>
                </table>
            </div>
            <div class="btnArea">
                <button class="btns btnSt01" onclick="window.location.href='/prof/syllabus?idPgm=${ProgramDetail.idPgm}'">
                    강의계획서
                </button>
                <button type="button" class="btns btnSt01" onclick="#">
                    <span>휴·보강신청</span>
                </button><button type="button" class="btns btnSt01" onclick="#">
                <span>출결관리</span>
            </button><button type="button" class="btns btnSt01" onclick="#">
                <span>과제관리</span>
            </button>
                <button type="button" class="btns btnSt02" onclick="history.back();">
                    <span>목록으로</span>
                </button>
            </div>
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>


<script>
    //체크박스 중복되지 않도록함 (하나의 강의만 선택하도록)
    function limitSelection(checkbox) {
        var checkboxes = document.getElementsByName('selectedProgram');
        checkboxes.forEach(function (cb) {
            if (cb !== checkbox) {
                cb.checked = false;
            }
        });
    }
    //강의계획서 입력 페이지 이동 @김봄이
    function syllabus(){
        var selectedProgram = document.querySelector('input[name="selectedProgram"]:checked');
        if (selectedProgram) {
            var idPgm = selectedProgram.parentNode.nextElementSibling.textContent; // 수업 ID를 가져옴
            window.location.href = '/prof/syllabus?idPgm=' + idPgm; // 프로그램 ID를 가지고 페이지 이동
        } else {
            alert('수업을 선택하세요.');
        }
    }

</script>
</body>

</html>