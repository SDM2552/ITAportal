<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>마이페이지</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header_prof.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_myPage.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동></span>
                <span>마이페이지></span>
                <span class="on">회원정보</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>회원정보</h3>
            <table class="tblData mt10">
                <!-- Other fields -->
                <tr>
                    <th>아이디</th>
                    <td><c:out value="${member.loginId}"/></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><c:out value="${member.email}"/> </td>
                </tr>




                <tr>
                    <th>이름</th>
                    <td><c:out value="${user.name}"/></td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>
                        <form id="updateForm1" action="/user/updateInfo" method="post">
                            <input type="date" name="birth" value="${user.birth}"/>
                            <input type="hidden" name="idUser" value="${user.idUser}"/>
                            <input type="hidden" name="tel" value="${user.tel}"/>
                            <input type="hidden" name="address" value="${user.address}"/>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" onclick="showModal('updateForm1')">수정</button>
                        </form>
                    </td>
                </tr>
                <tr>
                    <th>휴대전화</th>
                    <td>
                        <form id="updateForm2" action="/user/updateInfo" method="post">
                            <input type="text" name="tel" value="${user.tel}"/>
                            <input type="hidden" name="idUser" value="${user.idUser}"/>
                            <input type="hidden" name="address" value="${user.address}"/>
                            <input type="hidden" name="birth" value="${user.birth}"/>
                            <button type="button" class="btn btn-primary" onclick="showModal('updateForm2')">수정</button>
                        </form>
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <form id="updateForm3" action="/user/updateInfo" method="post">
                            <input type="text" name="address" value="${user.address}"/>
                            <input type="hidden" name="idUser" value="${user.idUser}"/>
                            <input type="hidden" name="birth" value="${user.birth}"/>
                            <input type="hidden" name="tel" value="${user.tel}"/>
                            <button type="button" class="btn btn-primary" onclick="showModal('updateForm3')">수정</button>
                        </form>
                    </td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td><c:out value="${user.gender == 'M' ? '남성' : '여성'}"/></td>
                </tr>

            </table>
        </div>
    </div>
    <c:import url="../layout/footer.jsp"/>

    <!-- Modal -->
    <div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">정보 수정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    정보를 변경하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" id="confirmBtn">확인</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Success Modal -->
    <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">변경 완료</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    정보가 변경되었습니다. 다시 로그인해 주세요.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="redirectToLogin()">확인</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showModal(formId) {
            $('#confirmBtn').attr('onclick', 'submitForm("' + formId + '")');
            $('#confirmationModal').modal('show');
        }

        function submitForm(formId) {
            $.ajax({
                type: 'POST',
                url: $('#' + formId).attr('action'),
                data: $('#' + formId).serialize(),
                success: function (response) {
                    if (response.success) {
                        alert(response.success);
                        window.location.href = '/'; // 로그인 페이지로 리다이렉트
                    } else {
                        alert(response.error);
                    }
                    $('#confirmationModal').modal('hide');
                }
            });
        }
    </script>


</div>
</body>
</html>
