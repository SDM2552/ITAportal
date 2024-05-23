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
    <c:import url="../layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_prof_program.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동 </span>
                <span class="on">강의 관리</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>출결 관리</h3>

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
            </div><br>

            <div class="boxCnt02">
                <div class="boxInner">
                    <div class="wrap-info">
                        <div class="stu-port">
                            <img src="/image/port.png" alt="">
                        </div>
                        <div class="textinfo">
                            <p style="font-size: 17px;font-weight: bold">김학생</p>
                            <p>asd@email.com</p>
                            <div style="margin: 5px 0">
                            <button class="button_blkline">출석</button>
                            <button class="button_blkline">지각 </button>
                            <button  class="button_blkline">결석</button>
                            </div>
                            <p>지각횟수 : 0 회</p>
                            <p>결석횟수 : 0 회</p>
                        </div>
                    </div>
                </div>
                <div class="boxInner">
                    <div class="wrap-info">
                        <div class="stu-port">
                            <img src="/image/port.png" alt="">
                        </div>
                        <div class="textinfo">
                            <p style="font-size: 17px;font-weight: bold">김학생</p>
                            <p>asd@email.com</p>
                            <div style="margin: 5px 0">
                                <button class="button_blkline">출석</button>
                                <button class="button_blkline">지각 </button>
                                <button  class="button_blkline">결석</button>
                            </div>
                            <p>지각횟수 : 0 회</p>
                            <p>결석횟수 : 0 회</p>
                        </div>
                    </div>
                </div><div class="boxInner">
                <div class="wrap-info">
                    <div class="stu-port">
                        <img src="/image/port.png" alt="">
                    </div>
                    <div class="textinfo">
                        <p style="font-size: 17px;font-weight: bold">김학생</p>
                        <p class="email">asasdasdd@email.com</p>
                        <div style="margin: 5px 0">
                            <button class="button_blkline">출석</button>
                            <button class="button_blkline">지각 </button>
                            <button  class="button_blkline">결석</button>
                        </div>
                        <p>지각횟수 : 0 회</p>
                        <p>결석횟수 : 0 회</p>
                    </div>
                </div>
            </div><div class="boxInner">
                <div class="wrap-info">
                    <div class="stu-port">
                        <img src="/image/port.png" alt="">
                    </div>
                    <div class="textinfo">
                        <p style="font-size: 17px;font-weight: bold">김학생</p>
                        <p>asd@email.com</p>
                        <div style="margin: 5px 0">
                            <button class="button_blkline">출석</button>
                            <button class="button_blkline">지각 </button>
                            <button  class="button_blkline">결석</button>
                        </div>
                        <p>지각횟수 : 0 회</p>
                        <p>결석횟수 : 0 회</p>
                    </div>
                </div>
            </div>
            </div><br>

            <h4 class="subTit">전체 출결 현황</h4>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="15%">
                        <col width="15%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">성명</th>
                        <th scope="col">이메일</th>
                        <th scope="col">출석</th>
                        <th scope="col">지각</th>
                        <th scope="col">결석</th>
                        <th scope="col">출석률%</th>
                    </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td>김학생</td>
                            <td>asd@email.com</td>
                            <td>3</td>
                            <td>0</td>
                            <td>0</td>
                            <td>100%</td>
                        </tr>
                    </tbody>
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