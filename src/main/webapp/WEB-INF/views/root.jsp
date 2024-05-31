<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>국제무역아카데미 포털</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="layout/header.jsp" />

    <!-- contents -->
    <div class="mainArea">
        <img src="image/academy.jpg" alt="" class="mainImg">

        <div class="mainBoard">
            <div class="memberInfo">
                <c:choose>
                    <c:when test="${not empty sessionScope.loginUser}">
                        <li style="font-weight: 600; font-size: 18px; width: 100%;">
                            &nbsp;<i class="fa-solid fa-user"></i>&nbsp; ${loginUser.name} 님 환영합니다.
                            <hr style="margin-top: 3px;">
                            <table>
                                <tr>
                                    <td>이메일</td>
                                    <td>${loginUser.email}</td>
                                </tr>
                                <tr>
                                    <td>직업</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${loginUser.role == 'stu'}">
                                                학생
                                            </c:when>
                                            <c:when test="${loginUser.role == 'prof'}">
                                                강사
                                            </c:when>
                                            <c:when test="${loginUser.role == 'admin'}">
                                                관리자
                                            </c:when>
                                            <c:otherwise>
                                                역할 없음
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <td>가입일</td>
                                    <td>${loginUser.registDate}</td>
                                </tr>

                            </table>

                            <div class="profileButton">
                                <button onclick="location.href='/user/info'">마이페이지</button>
                                <button onclick="location.href='/user/logout'">로그아웃</button>
                            </div>
                        </li>
                </c:when>
                <c:otherwise>
                    <li style="font-weight: 600; font-size: 18px; width: 100%;">
                        로그인 </li>
                    <div class="loginFormBorder">
                        <ul class="loginForm">
                            <li>
                                <input type="text" class="inTxt" id="loginId" name="loginId" style="ime-mode:disabled;"
                                       maxlength="20" placeholder="  아이디" title="아이디 입력">
                            </li>
                            <li>
                                <input type="password" class="inTxt" id="password" name="password"
                                       style="ime-mode:disabled;" maxlength="20" placeholder=" 비밀번호"
                                       title="비밀번호 입력">
                            </li>
                        </ul>
                        <a href="javascript:login();" class="logBtn">
                            <span>로그인</span>
                        </a>
                    </div>
                    <div class="profileButton">
                        <a href="/user/signUp">회원 가입</a>
                        <span>|</span>
                        <a href="#">아이디 / 비밀번호 찾기</a>
                    </div>
                </c:otherwise>
                </c:choose>
            </div>
            <div id="noticeBoard">
                <h2>
                    <a href="/notice/noticeList">공지사항</a>
                </h2>
                <div class="main--page--split"></div>
                <table id="latestNotices">
                    <!-- 최신 공지사항이 여기 로드됩니다 -->
                </table>
            </div>
        </div>

    </div>
    <!-- //contents -->
</div>

<!-- footer -->
<c:import url="layout/footer.jsp" />

<script>

    // Enter 로그인 이벤트 바인딩
    window.onload = () => {
        document.querySelectorAll('#loginId, #password').forEach(element => {
            element.addEventListener('keyup', (e) => {
                if (e.keyCode === 13) {
                    login();
                }
            })
        })
    }

    function login() {

        const loginId = document.querySelector('.loginForm input[name="loginId"]').value;
        const password = document.querySelector('.loginForm input[name="password"]').value;


        if ( !loginId || !password ) {
            alert('아이디와 비밀번호를 모두 입력해 주세요.');
            return false;
        }

        $.ajax({
            url : '/user/loginCheck',
            type : 'POST',
            dataType : 'json',
            data : {
                loginId: loginId,
                password: password
            },
            async : false,
            success : function (response) {
                alert('로그인 되었습니다.>_<');
                window.location.href = "/user/logined";
            },
            error : function (request, status, error) {
                alert('아이디와 비밀번호를 확인해 주세요.');
            }
        })
    }
    $(document).ready(function() {
        $.ajax({
            url: '/notice/latest',
            method: 'GET',
            success: function(data) {
                var table = $('#latestNotices');
                table.empty();
                data.forEach(function(notice) {
                    var row = $('<tr></tr>');
                    var title = $('<td></td>').append($('<a></a>').attr('href', '/notice/view/' + notice.idNotice).text(notice.title));
                    var date = $('<td></td>').text(notice.createdDate);
                    row.append(title).append(date);
                    table.append(row);
                });
            }
        });
    });

</script>

</body>

</html>