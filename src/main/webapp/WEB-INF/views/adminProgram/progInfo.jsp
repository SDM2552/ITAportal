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
    <title>프로그램 정보</title>
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
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span>교육과정관리 <i class="fa-solid fa-angle-right"></i></span><span class="on"> 프로그램 정보</span>
            <!-- //location -->

            <h3 class="pgTit">교육과정관리</h3>

            <!-- 본문 -->
            <h4 class="subTit">프로그램 정보</h4>
            <form id="progUpdate" method="get" action="/progUpdateInput">
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
                            <td>
                                ${pr.idCate}
                            </td>
                            <th scope="col">주제분류명</th>
                            <td>
                                ${pr.cateName}
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">강의실코드</th>
                            <td>
                                ${pr.idRoom}
                            </td>
                            <th scope="col">강의실명</th>
                            <td>
                                ${pr.roomName}
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">강사코드</th>
                            <td>
                                ${pr.idProf}
                            </td>
                            <th scope="col">강사명</th>
                            <td>
                                ${pr.name}
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">프로그램명</th>
                            <td colspan="3">
                                ${pr.pgmName}
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">교육시작일자</th>
                            <td>
                                ${pr.stDt}
                            </td>
                            <th scope="col">교육종료일자</th>
                            <td>
                                ${pr.endDt}
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">접수시작일자</th>
                            <td>
                                ${pr.sugangStDt}
                            </td>
                            <th scope="col">접수종료일자</th>
                            <td>
                                ${pr.sugangEndDt}
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">교육대상</th>
                            <td colspan="3">
                                ${pr.pgmTarget}
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">교육방법</th>
                            <td colspan="3">
                                ${pr.pgmMethod}
                            </td>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">교육인원</th>
                            <td colspan="3">
                                ${pr.pgmPer}
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">교육비</th>
                            <td colspan="3">
                                ${pr.pgmFee}
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            <div class="btnArea">
                <button type="submit" class="btns btnSt01">
                    <span>수정</span>
                </button>
                <button type="button" class="btns btnSt02" onclick="history.back();">
                    <span>목록</span>
                </button>
            </div>
            </form>
        </div>
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>
</body>

</html>
