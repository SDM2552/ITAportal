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
    <title>프로그램수정</title>
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
    <c:import url="../layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_program.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span>강의 관리 <i class="fa-solid fa-angle-right"></i></span><span>교육과정 관리 <i class="fa-solid fa-angle-right"></i></span><span class="on"> 프로그램 수정</span>
            <!-- //location -->

            <h3 class="pgTit">교육과정관리</h3>

            <!-- 본문 -->
            <h4 class="subTit">프로그램 수정</h4>
            <form id="progInputForm" method="post" action="/progUpdate">
                <input type="hidden" name="idPgm" value="${pr.idPgm}">
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
                                <input type="text" class="form-control" id="idCate" placeholder="주제분류코드" value="${pr.idCate}" name="idCate">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">강의실코드</th>
                            <td colspan="3">
                                <input type="text" class="form-control" id="idRoom" placeholder="강의실코드" value="${pr.idRoom}" name="idRoom">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">강사코드</th>
                            <td colspan="3">
                                <input type="text" class="form-control" id="idProf" placeholder="강사코드" value="${pr.idProf}" name="idProf">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">프로그램명</th>
                            <td colspan="3">
                                <input type="text" class="form-control" id="pgmName" placeholder="프로그램명 입력" value="${pr.pgmName}" name="pgmName">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">교육시작일자</th>
                            <td>
                                <input type="date" class="form-control" id="stDt" placeholder="교육시작일자" value="${pr.stDt}" name="stDt">
                            </td>
                            <th scope="col">교육종료일자</th>
                            <td>
                                <input type="date" class="form-control" id="endDt" placeholder="교육종료일자" value="${pr.endDt}" name="endDt">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">접수시작일자</th>
                            <td>
                                <input type="date" class="form-control" id="sugangStDt" placeholder="접수시작일자" value="${pr.sugangStDt}" name="sugangStDt">
                            </td>
                            <th scope="col">접수종료일자</th>
                            <td>
                                <input type="date" class="form-control" id="sugangEndDt" placeholder="접수종료일자" value="${pr.sugangEndDt}" name="sugangEndDt">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">교육대상</th>
                            <td colspan="3">
                                <input type="text" class="form-control" id="pgmTarget" placeholder="교육대상" value="${pr.pgmTarget}" name="pgmTarget">
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
                                <input type="text" class="form-control" id="pgmPer" placeholder="교육인원" value="${pr.pgmPer}" name="pgmPer">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">교육비</th>
                            <td colspan="3">
                                <input type="text" class="form-control" id="pgmFee" placeholder="교육비" value="${pr.pgmFee}" name="pgmFee">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="btnArea">
                    <button type="submit" class="btns btnSt01">
                        <span>등록</span>
                    </button>
                    <button type="button" class="btns btnSt02" onclick="history.back();">
                        <span>취소</span>
                    </button>
                </div>
            </form>
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>
</body>

</html>
