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
    <title>샘플 페이지</title>
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
            <div class="location">
                <span class="home" title="홈">홈으로 이동</span>
                <span>수강 내역 조회</span>
                <span class="on">수강 내역</span>
            </div>
            <!-- //location -->
            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>휴보강 신청</h3>
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
                    <td><div id="category">카테고리ㅇㅇ</div></td>
                    <th><label for="pgmName">교과목명<br>(Program Title)</label></th>
                    <td><div id="pgmName">강의명ㅇㅇ</div></td>
                </tr>
                <tr>
                    <th><label for="classRoom">수업시간/강의실<br>(Class Time/Class Room)</label></th>
                    <td><div id="classRoom">수업시간ㅇㅇ</div></td>
                    <th><label for="programDuration">강의기간<br>(Program Duration)</label></th>
                    <td><div id="programDuration">언제부터 ~ 언제까지</div></td>
                </tr>
                </tbody>
            </table><br>
            <h4 class="subTit">휴보강 신청</h4>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tbody class="mid">
                    <tr>
                        <th scope="col">휴강 일자</th>
                        <td>
                            <input type="text" style="width: 100%;">
                        </td>
                        <th scope="col">휴강 강의실</th>
                        <td>
                            <input type="text"  style="width: 100%;">
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">보강 일자</th>
                        <td>
                            <input type="text" style="width: 100%;">
                        </td>
                        <th scope="col">보강 강의실</th>
                        <td>
                            <input type="text"  style="width: 100%;">
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">휴강 사유</th>
                        <td colspan="3">
                            <textarea placeholder="내용을 입력하세요."></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">신청 일시</th>
                        <td>
                        </td>
                        <th scope="col">진행 상태</th>
                        <td>
                        </td>
                    </tr>



                    </tbody>
                </table>
            </div>
            <!-- btn -->
            <div class="btnArea">
                <button type="submit" class="btns btnSt01">
                    <span>생성</span>
                </button>
                <button type="button" class="btns btnSt02" onclick="history.back();">
                    <span>목록으로</span>
                </button>
            </div>
            <!-- btn -->
            <br>

            <h4 class="subTit">휴보강 이력</h4>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="15%">
                        <col width="15%">
                        <col width="30%">
                        <col width="25%">
                        <col width="25%">
                        <col width="25%">
                        <col width="25%">

                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">개설강좌명</th>
                        <th scope="col">휴강일자</th>
                        <th scope="col">보강일자</th>
                        <th scope="col">보강강의실</th>
                        <th scope="col">보강사유</th>
                        <th scope="col">진행상태</th>
                        <th scope="col">신청취소</th>
                    </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
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
</body>

</html>