<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>회원탈퇴</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_myPage.jsp" />
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
<%--                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirmModal">회원 탈퇴하기</button>--%>
                <a href="/user/delete2">탈퇴하기</a>
                <br><br>
                <p>탈퇴에 관한 자세한 내용은 고객센터로 문의해 주세요.</p>
                <p>감사합니다.</p>
                <p>평생교육원 드림.</p>
            </div>
        </div>
    </div>

    <c:import url="../layout/footer.jsp" />
</div>

<!-- Confirmation Modal -->
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmModalLabel">비밀번호 확인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="confirmForm">
                    <div class="form-group">
                        <label for="password">현재 비밀번호</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="confirmBtn">탈퇴</button>
            </div>
        </div>
    </div>
</div>

<!-- Success Modal -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">탈퇴 완료</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                회원 탈퇴가 완료되었습니다. 메인 페이지로 이동합니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="redirectBtn">확인</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#confirmBtn').on('click', function() {
            var password = $('#password').val();
            if (password) {
                $.ajax({
                    type: 'POST',
                    url: '/user/delete',
                    data: JSON.stringify({ password: password }),
                    contentType: 'application/json',
                    success: function(response) {
                        if (response.success) {
                            $('#confirmModal').modal('hide');
                            $('#successModal').modal('show');
                        } else {
                            alert(response.error);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error('Error:', textStatus, errorThrown);
                        console.error('Response:', jqXHR.responseText);
                        alert('서버와의 통신 중 오류가 발생했습니다.');
                    }
                });
            } else {
                alert('비밀번호를 입력해 주세요.');
            }
        });

        $('#redirectBtn').on('click', function() {
            window.location.href = '/';
        });

        $('#confirmModal').on('hidden.bs.modal', function () {
            $('#password').val('');
        });

        $('#successModal').on('hidden.bs.modal', function () {
            window.location.href = '/';
        });
    });
</script>
</body>
</html>
