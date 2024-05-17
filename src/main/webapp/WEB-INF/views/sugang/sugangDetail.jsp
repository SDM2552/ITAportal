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
        <c:import url="../layout/nav_sugang.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동</span>
                <span>수강 내역 조회</span>
                <span class="on">수강 내역</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>수강 신청</h3>

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
                        <th scope="col">구분</th>
                        <td colspan="3">
                            신 중년맞춤프로그램
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">프로그램명</th>
                        <td colspan="3">
                            국외여행인솔자 자격증 과정
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">교육기간</th>
                        <td>
                            2024-11-09 ~ 2024-11-10
                        </td>
                        <th scope="col">강의 요일/시간</th>
                        <td>
                            토,일/09:00~18:00
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">총시수</th>
                        <td>
                            15시간
                        </td>
                        <th scope="col">교육일수</th>
                        <td>
                            2일
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">모집 정원</th>
                        <td>
                            10명
                        </td>
                        <th scope="col">일일시수</th>
                        <td>
                            8시간
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">교육 장소</th>
                        <td colspan="3">
                            동서울대학교 평생교육원 130호
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <br><br><br><br><br><br>
            <h4 class="subTit">신청자 정보</h4>
            <div class="coment_form mt10">
                <p>* 주소, 휴대폰번호, 이메일 정보를 변경하시려면 <strong>마이페이지 > 회원정보변경</strong>에서 변경하시면 됩니다</p>
                <a href="/mypage/myPage.do">회원정보변경</a>
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
                        <th scope="col">구분</th>
                        <td colspan="3">
                            신 중년맞춤프로그램
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">프로그램명</th>
                        <td colspan="3">
                            국외여행인솔자 자격증 과정
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">교육기간</th>
                        <td>
                            2024-11-09 ~ 2024-11-10
                        </td>
                        <th scope="col">강의 요일/시간</th>
                        <td>
                            토,일/09:00~18:00
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">총시수</th>
                        <td>
                            15시간
                        </td>
                        <th scope="col">교육일수</th>
                        <td>
                            2일
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">모집 정원</th>
                        <td>
                            10명
                        </td>
                        <th scope="col">일일시수</th>
                        <td>
                            8시간
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">교육 장소</th>
                        <td colspan="3">
                            동서울대학교 평생교육원 130호
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <!-- btn -->
            <div class="btnArea">
                <button type="submit" class="btns btnSt01">
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
</body>

</html>