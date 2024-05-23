<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>프로그램추가</title>
    <style>
        th, td {
            white-space: nowrap;
        }
        th {
            width: 120px; /* 제목 칸의 너비를 고정 */
        }
    </style>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header_admin.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_program.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동</span>
                <span>강의관리</span>
                <span class="on">교육과정관리</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>교육과정관리</h3>

            <!-- 본문 -->
            <h4 class="subTit">프로그램 추가</h4>
            <form id="progInputForm" method="post" action="/progInsert" >
                <div class="tblForm inputForm mt10">
                    <table>
                        <colgroup>
                            <col style="width:160px">
                            <col style="width:280px">
                            <col style="width:100px">
                            <col class="sm-wd">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="col">주제분류코드</th>
                            <td colspan="3">
                                <input type="text" class="form-control" id="cateName" placeholder="주제분류명" name="cateName" readonly>
                                <button type="button" onclick="openPopup1()">검색</button>
                                <input type="hidden" id="idCate" name="idCate">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">강의실코드</th>
                            <td colspan="3">
                                <input type="text" class="form-control" id="roomName" placeholder="강의실명" name="roomName" readonly>
                                <button type="button" onclick="openPopup2()">검색</button>
                                <input type="hidden" id="idRoom" name="idRoom">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">강사코드</th>
                            <td colspan="3">
                                <input type="text" class="form-control" id="name" placeholder="강사명" name="name" readonly>
                                <button type="button" onclick="openPopup3()">검색</button>
                                <input type="hidden" id="idProf" name="idProf">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">프로그램명</th>
                            <td colspan="3">
                                <input type="text" class="form-control" id="pgmName" placeholder="프로그램명 입력" name="pgmName">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">교육시작일자</th>
                            <td>
                                <input type="date" class="form-control" id="stDt" name="stDt">
                            </td>
                            <th scope="col">교육종료일자</th>
                            <td>
                                <input type="date" class="form-control" id="endDt" name="endDt">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">접수시작일자</th>
                            <td>
                                <input type="date" class="form-control" id="sugangStDt" name="sugangStDt">
                            </td>
                            <th scope="col">접수종료일자</th>
                            <td>
                                <input type="date" class="form-control" id="sugangEndDt" name="sugangEndDt">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">교육대상</th>
                            <td colspan="3">
                                <input type="text" class="form-control" id="pgmTarget" placeholder="교육대상" name="pgmTarget">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">교육방법</th>
                            <td colspan="3">
                                <select class="form-control" id="pgmMethod" name="pgmMethod">
                                    <option value="">선택하세요</option>
                                    <option value="온라인">온라인</option>
                                    <option value="오프라인">오프라인</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">교육인원</th>
                            <td colspan="3">
                                <input type="text" class="form-control" id="pgmPer" placeholder="교육인원" name="pgmPer">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">교육비</th>
                            <td colspan="3">
                                <input type="text" class="form-control" id="pgmFee" placeholder="교육비" name="pgmFee">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="btnArea">
                    <button type="submit" class="btns btnSt01">
                        <span>추가</span>
                    </button>
                    <button type="button" class="btns btnSt02" onclick="history.back();">
                        <span>목록</span>
                    </button>
                </div>
            </form>
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>
    <script>
        function openPopup1() {

            window.open(
                "/catePopUp", // 팝업창에 표시할 페이지 경로
                "popupWindow", // 팝업창의 이름
                "width=600,height=600,scrollbars=yes,resizable=yes" // 팝업창의 특성 (너비, 높이, 스크롤바, 크기 조정 가능 여부)
            );
        }
    </script>
    <script>
        function openPopup2() {
            window.open(
                "/classRoomPopUp", // 팝업창에 표시할 페이지 경로
                "popupWindow", // 팝업창의 이름
                "width=600,height=600,scrollbars=yes,resizable=yes" // 팝업창의 특성 (너비, 높이, 스크롤바, 크기 조정 가능 여부)
            );
        }
    </script>
    <script>
        function openPopup3() {
            window.open(
                "/profPopUp", // 팝업창에 표시할 페이지 경로
                "popupWindow", // 팝업창의 이름
                "width=600,height=600,scrollbars=yes,resizable=yes" // 팝업창의 특성 (너비, 높이, 스크롤바, 크기 조정 가능 여부)
            );
        }
    </script>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>
</body>
</html>
