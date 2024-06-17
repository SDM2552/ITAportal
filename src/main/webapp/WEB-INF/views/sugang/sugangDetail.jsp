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
    <title>수강 신청</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_sugang.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
                <span>수강 신청 <i class="fa-solid fa-angle-right"></i> </span><span class="on">프로그램 정보</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit">수강 신청</h3>

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
                            ${program.cateName}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">프로그램명</th>
                        <td colspan="3">
                            ${program.pgmName}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">교육기간</th>
                        <td>
                            ${program.stDt} ~ ${program.endDt}
                        </td>
                        <th scope="col">교육 장소</th>
                        <td>
                            ${program.roomName}
                        </td>

                    </tr>

                    <tr>
                        <th scope="col">강사</th>
                        <td>
                            ${program.profName}
                        </td>
                        <th scope="col">강의 요일/시간</th>
                        <td>
                            ${program.pgmDay} / ${program.pgmTime}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">모집 정원</th>
                        <td>
                            ${program.pgmPer}명
                        </td>
                        <th scope="col">강좌 구분</th>
                        <td>
                            ${program.pgmMethod}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">신청 대상</th>
                        <td colspan="3">
                            ${program.pgmTarget}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">수강료</th>
                        <td colspan="3">
                            ${program.pgmFee}
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <br><br><br><br><br>
            <h4 class="subTit">신청자 정보</h4>
            <div class="coment_form mt10">
                <p>* 주소, 휴대폰번호, 이메일 정보를 변경하시려면 <strong>마이페이지 > 회원정보변경</strong>에서 변경하시면 됩니다</p>
                <a href="/user/info">회원정보변경</a>
            </div>
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
                        <th scope="col">신청자명</th>
                        <td colspan="3">
                            ${studentInfo.name}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">주소</th>
                        <td colspan="3">
                            ${studentInfo.address}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">휴대폰번호</th>
                        <td colspan="3">
                            ${studentInfo.tel}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">이메일</th>
                        <td colspan="3">
                            ${studentInfo.email}
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <!-- btn -->
            <div class="btnArea">

                <button type="button" class="btns btnSt01" onclick="applyEnrollment(${loginUser.commonId}, ${program.idPgm}, ${program.idCate}, '${program.pgmName}');">

                    <span>수강신청</span>
                </button>
                <button type="button" class="btns btnSt02" onclick="history.back();">
                    <span>취소</span>
                </button>
            </div>
            <!-- btn -->
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>
<script>

    function applyEnrollment(commonId, idPgm, idCate, pgmName) {
        if (confirm(pgmName + " 강의를 수강신청하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: "/program/result",
                data: JSON.stringify({
                    commonId: commonId,
                    idPgm: idPgm,
                    idCate: idCate
                }),
                contentType: "application/json",
                success: function(response) {
                    if (response === "수강신청이 완료되었습니다.") {
                        // 성공 시 페이지 이동
                        window.location.href = "/program/result";
                    } else if (response === "이미 수강신청한 강의입니다.") {
                        // 이미 신청한 경우 경고 메시지
                        alert(response);
                    }
                },
                error: function(xhr, status, error) {
                    console.error("수강 신청 중 오류가 발생했습니다:", error);
                    alert("수강 신청 중 오류가 발생했습니다.");
                }
            });
        }
    }
</script>
</body>

</html>