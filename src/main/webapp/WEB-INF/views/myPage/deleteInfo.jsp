<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <title>회원탈퇴</title>

</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_myPage.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i
                    class="fa-solid fa-angle-right"></i></span>
            <span>MY <i class="fa-solid fa-angle-right"></i></span><span class="on"> 회원 탈퇴</span>
            <!-- //location -->
            <h3 class="pgTit">회원탈퇴</h3>
            <div>
                <p>안녕하세요,</p>
                <p>국제무역아카데미 회원님께,</p>
                <p>회원 탈퇴는 곧 모든 서비스와 혜택의 손실로 이어집니다. 회원님의 국제무역아카데미 회원 탈퇴에 대해 안내드립니다.</p><br>
                <h5><p><strong>주의사항:</strong></p></h5><br>
                <ul>
                    <li>• 회원 탈퇴는 돌이킬 수 없습니다: 한 번 탈퇴하면, 모든 회원 정보와 이력이 삭제되며, 복구가 불가능합니다.</li>
                    <li>• 서비스 이용 중단: 탈퇴 시, 현재 이용 중인 모든 서비스와 혜택은 즉시 중단됩니다.</li>
                    <li>• 보유 정보의 삭제: 회원 탈퇴 시, 회원님의 모든 개인 정보는 안전하게 삭제됩니다.</li>
                    <li>• 회원 복구 불가: 탈퇴한 이후에는 새로운 가입으로 회원님의 복구가 불가능합니다.</li>
                </ul>
                <br>
                <br>
                <h5><p><strong>탈퇴하기 전에 고려해야 할 사항:</strong></p></h5><br>
                <ul>
                    <li>• 재가입이 불가능합니다: 회원 탈퇴 후에는 새로운 회원 가입을 진행해야 합니다.</li>
                    <li>• 데이터 백업: 탈퇴하기 전에 중요한 데이터나 파일은 반드시 백업해 주세요.</li>
                    <li>• 서비스 중단: 탈퇴 시, 현재 이용 중인 서비스와 혜택이 모두 중단됩니다.</li>
                </ul>
                <br/>
                <p>위 주의사항 및 사전 안내를 확인하시고, 회원 탈퇴에 동의하시는 경우 아래 버튼을 클릭하여 진행해 주세요.</p><br>


                <button href="/user/delete" class="btns delet" data-toggle="modal" data-target="#confirmModal">탈퇴하기</button>

                <br><br>
                <p>탈퇴에 관한 자세한 내용은 고객센터로 문의해 주세요.</p>
                <p>감사합니다.</p>
                <p>국제무역아카데미 드림.</p>
            </div>
        </div>
    </div>
</div>

<c:import url="../layout/footer.jsp"/>
</div>

<!-- Confirmation Modal -->
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel"
     aria-hidden="true">
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

<!-- 비밀번호 확인을 위한 Modal -->
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel"
     aria-hidden="true">
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
                <button type="button" class="btn btn-primary" id="confirmBtn">확인</button>
            </div>
        </div>
    </div>
</div>

<!-- 회원 탈퇴 완료 모달 -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel"
     aria-hidden="true">
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
    $(document).ready(function () {
        $('#confirmBtn').on('click', function () {
            var password = $('#password').val();
            if (password) {
                $.ajax({
                    type: 'POST',
                    url: '/user/delete',
                    data: JSON.stringify({password: password}),
                    contentType: 'application/json',
                    success: function (response) {
                        console.log('서버 응답:', response);  // 서버 응답을 로그에 출력하여 확인
                        if (response.success) {
                            $('#confirmModal').modal('hide');
                            $('#successModal').modal('show');
                        } else {
                            console.log('비밀번호 불일치:', response.error);  // 로그 추가
                            alert(response.error || '비밀번호가 일치하지 않습니다.');
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error('Error:', textStatus, errorThrown);
                        console.error('Response:', jqXHR.responseText);
                        alert('서버 오류가 발생했습니다. 다시 시도해 주세요.');
                    }
                });
            } else {
                alert('비밀번호를 입력해 주세요.');
            }
        });

        $('#redirectBtn').on('click', function () {
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
