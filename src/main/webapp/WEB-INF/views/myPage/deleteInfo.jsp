<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>회원탈퇴</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_stu_myPage.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동></span>
                <span>마이페이지></span>
                <span class="on">회원탈퇴</span>
            </div>
            <!-- //location -->
            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>회원탈퇴</h3>
            <div>
                <p>안녕하세요,</p>
                <p>평생교육원 회원님께,</p>
                <p>회원 탈퇴는 곧 모든 서비스와 혜택의 손실로 이어집니다. 회원님의 평생교육원 회원 탈퇴에 대해 안내드립니다.</p><br>
                <p><strong>주의사항:</strong></p>
                <ul>
                    <li>회원 탈퇴는 돌이킬 수 없습니다: 한 번 탈퇴하면, 모든 회원 정보와 이력이 삭제되며, 복구가 불가능합니다.</li>
                    <li>서비스 이용 중단: 탈퇴 시, 현재 이용 중인 모든 서비스와 혜택은 즉시 중단됩니다.</li>
                    <li>보유 정보의 삭제: 회원 탈퇴 시, 회원님의 모든 개인 정보는 안전하게 삭제됩니다.</li>
                    <li>회원 복구 불가: 탈퇴한 이후에는 새로운 가입으로 회원님의 복구가 불가능합니다.</li>
                </ul><br>
                <p><strong>탈퇴하기 전에 고려해야 할 사항:</strong></p>
                <ul>
                    <li>재가입이 불가능합니다: 회원 탈퇴 후에는 새로운 회원 가입을 진행해야 합니다.</li>
                    <li>데이터 백업: 탈퇴하기 전에 중요한 데이터나 파일은 반드시 백업해 주세요.</li>
                    <li>서비스 중단: 탈퇴 시, 현재 이용 중인 서비스와 혜택이 모두 중단됩니다.</li>
                </ul>
                <p>위 주의사항 및 사전 안내를 확인하시고, 회원 탈퇴에 동의하시는 경우 아래 버튼을 클릭하여 진행해 주세요.</p><br>
                <button type="button"><a href="/user/delete">회원 탈퇴하기</a></button><br><br>
                <p>탈퇴에 관한 자세한 내용은 고객센터로 문의해 주세요.</p>
                <p>감사합니다.</p>
                <p>평생교육원 드림.</p>
            </div>



            </div>
        </div>
    </div>

<c:import url="../layout/footer.jsp" />
</div>
</body>
</html>
