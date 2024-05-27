<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>마이페이지</title>
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
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span>MY <i class="fa-solid fa-angle-right"></i></span><span class="on"> 비밀번호 변경</span>
            <!-- //location -->

            <h3 class="pgTit">비밀번호 변경</h3>
            <form id="passwordUpdate" action="/user/passwordUpdate" method="post">
                <table class="table table-bordered">
                    <tr>
                        <th>현재 비밀번호</th>
                        <td>
                            <input type="password" name="currentPassword" placeholder="현재 비밀번호" required>
                        </td>
                    </tr>
                    <tr>
                        <th>새 비밀번호</th>
                        <td>
                            <input type="password" name="newPassword" placeholder="새 비밀번호" required>
                        </td>
                    </tr>
                    <tr>
                        <th>새 비밀번호 확인</th>
                        <td>
                            <input type="password" name="confirmPassword" placeholder="새 비밀번호 확인" required>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#confirmationModal">수정</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <c:import url="../layout/footer.jsp" />

    <!-- Confirmation Modal -->
    <div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경 확인</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    비밀번호를 변경하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" id="confirmBtn">확인</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Success/Error Modal -->
    <div class="modal fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="resultModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="resultModalLabel">알림</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="resultModalBody">
                    <!-- 메시지가 여기에 표시됩니다. -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $('#confirmBtn').click(function () {
            $.ajax({
                type: 'POST',
                url: $('#passwordUpdate').attr('action'),
                data: $('#passwordUpdate').serialize(),
                success: function (response) {
                    $('#confirmationModal').modal('hide');
                    $('#resultModalBody').text(response.success || '비밀번호가 성공적으로 변경되었습니다.');
                    $('#resultModal').modal('show');
                },
                error: function (xhr) {
                    $('#confirmationModal').modal('hide');
                    var response = xhr.responseJSON;
                    $('#resultModalBody').text(response.error || '비밀번호 변경에 실패했습니다.');
                    $('#resultModal').modal('show');
                }
            });
        });
    </script>
</div>
</body>

</html>
