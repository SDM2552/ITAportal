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
    <style>
        @font-face {
            font-family: 'BlackHanSans';
            src: url('../font/BlackHanSans-Regular.ttf') format('truetype');
            font-weight: normal;
            font-style: normal;
        }
        .mainArea {
            position: relative;
        }

        .textOverlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start; /* 텍스트를 위로 정렬 */
            padding-top: 50px; /* 필요에 따라 패딩 조정 */
            color: white; /* 텍스트 색상 */
            text-align: center;
            opacity: 0; /* 초기 상태를 투명하게 설정 */
            animation: fadeIn 1s ease-in-out forwards; /* 애니메이션 적용 */
            animation-delay: 0.5s; /* 애니메이션 딜레이 추가 */
            pointer-events: none; /* 오버레이 요소가 클릭 이벤트를 받지 않도록 함 */
        }

        .textOverlay p {
            margin: 10px 0; /* 필요에 따라 조정 */
            font-size: 3em; /* 필요에 따라 조정 */
            font-family: 'BlackHanSans', serif; /* 폰트 적용 */
            text-shadow:
                    1px 1px 2px rgba(0, 0, 0, 0.8),  /* 기본 그림자 */
                    2px 2px 4px rgba(0, 0, 0, 0.6),  /* 추가 그림자 */
                    3px 3px 8px rgba(0, 0, 0, 0.4);  /* 더 멀리 있는 그림자 */
            opacity: 0; /* 초기 상태를 투명하게 설정 */
            animation: fadeIn 1s ease-in-out forwards; /* 애니메이션 적용 */
        }

        .textOverlay .txt1 {
            animation-delay: 0s; /* 첫 번째 텍스트 애니메이션 딜레이 */
        }

        .textOverlay .txt2 {
            animation-delay: 1.5s; /* 두 번째 텍스트 애니메이션 딜레이 */
        }

        /* 스르륵 나타나는 애니메이션 정의 */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
    <title>국제무역아카데미 포털</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="layout/header.jsp" />

    <!-- contents -->
    <div class="mainArea">
        <img src="image/academy.jpg" alt="" class="mainImg">
        <div class="textOverlay">
            <p class="txt1">세계로 나아가는 인재를 키우는</p>
            <p class="txt2">국제무역아카데미와 함께하세요</p>
        </div>


        <div class="mainBoard">
            <div class="memberInfo">
                <c:choose>
                    <c:when test="${not empty sessionScope.loginUser}">
                        <li style="font-weight: 600; font-size: 18px; width: 100%;">
                            &nbsp;<i class="fa-solid fa-user"></i>&nbsp; ${loginUser.name} 님 환영합니다.
                            <hr style="margin-top: 3px;">
                            <table>
                                <tr>
                                    <td>
                                        <c:choose>
                                            <c:when test="${loginUser.role == 'stu'}">
                                                학번
                                            </c:when>
                                            <c:when test="${loginUser.role == 'prof'}">
                                                강사번호
                                            </c:when>
                                            <c:when test="${loginUser.role == 'admin'}">
                                                관리번호
                                            </c:when>
                                            <c:otherwise>
                                                역할 없음
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${loginUser.commonId}</td>
                                </tr>
                                <tr>
                                    <td>이메일</td>
                                    <td>${loginUser.email}</td>
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
                        <a href="/user/findId">아이디 찾기</a>
                        <span>|</span>
                        <a href="/user/findPassword">비밀번호 찾기</a>
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
                alert('로그인 성공.');
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