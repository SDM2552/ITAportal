<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <title>마이페이지</title>
    <style>

        .tblData th,
        .tblData td {
            text-align: left; /* 모든 셀을 좌측 정렬로 설정 */
        }

        .btn2 {
            border: 1px solid #bfbfbf;
            background: #e0e0e0;
            color: #333;
            float: right;
            width: 50px; /* 너비 설정 */
            height: 35px; /* 높이 설정 */
        }


    </style>
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
            <span>MY <i class="fa-solid fa-angle-right"></i></span><span class="on"> 회원 정보</span>
            <!-- //location -->
            <h3 class="pgTit">회원정보</h3>
            <table class="tblData mt10">
                <!-- Other fields -->
                <tr>
                    <th>아이디</th>
                    <td style="text-align: left"><c:out value="${member.loginId}"/></td>

                </tr>
                <tr>
                    <th>
                        이메일
                    </th>
                    <form id="updateForm4" action="/user/updateInfo" method="post">
                        <input type="hidden" name="idUser" value="${user.idUser}"/>
                        <td td style="text-align: left" colspan="3" class="email">

                            <%--                            <input type="hidden" name="idUser" value="${user.idUser}"/>--%>
                            <input type="text" class="inTxt rs-w40" id="email_01" name="email1" value="${email1}"
                                   onFocus="checkLen(this.value);" onBlur="checkMail(this.value);"
                                   style="width:120px;ime-mode:disabled;" title="이메일 아이디 입력"/>
                            <span class="dash"> @ </span>
                            <label for="email_02" class="disn">이메일 입력</label>
                            <input type="text" class="inTxt rs-w45" id="email_02" name="email2" value="${email2}"
                                   onFocus="checkLen(this.value);" onBlur="checkMail(this.value);"
                                   style="width:120px;ime-mode:disabled;" title="이메일 입력"/>
                            <span class="selectboxWrap" style="width:180px">
                <label for="email_03" class="disn">이메일 선택</label>
                <select class="select selectBg" id="email_03" name="email2"
                    onchange="chgEmail(this.value, this.selectedIndex);" title="이메일 선택">
                <option value="">직접입력</option>
                <option value="gmail.com" <c:if test="${email2 == 'gmail.com'}">selected</c:if>>gmail.com</option>
                <option value="kakao.com" <c:if test="${email2 == 'kakao.com'}">selected</c:if>>kakao.com</option>
                <option value="naver.com" <c:if test="${email2 == 'naver.com'}">selected</c:if>>naver.com</option>
                <option value="nate.com" <c:if test="${email2 == 'nate.com'}">selected</c:if>>nate.com</option>
                <option value="yahoo.co.kr" <c:if test="${email2 == 'yahoo.co.kr'}">selected</c:if>>yahoo.co.kr</option>
                </select>
                                <input type="hidden" name="phone1" value="${phone1}">
                            <input type="hidden" name="phone2" value="${phone2}">
                            <input type="hidden" name="phone3" value="${phone3}">
                            <input type="hidden" name="address" value="${user.address}"/>
                                 <input type="hidden" name="birthyy" value="${birthYear}">
                            <input type="hidden" name="birthmm" value="${birthMonth}">
                            <input type="hidden" name="birthdd" value="${birthDay}">
                            </span>
                            <button type="button" class="btn2" onclick="showModal('updateForm4')">수정</button>
                        </td>
                    </form>
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td td style="text-align: left"><c:out value="${user.name}"/></td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td td style="text-align: left">
                        <form id="updateForm1" action="/user/updateInfo" method="post">


                            <select class="select selectBg" id="birthyy" name="birthyy" title="년도 선택">
                                <option value="">년도</option>
                                <c:forEach var="year" begin="1900" end="2100">
                                    <option value="${year}" <c:if test="${birthYear == year}">selected</c:if>>${year}년
                                    </option>
                                </c:forEach>
                            </select>

                            <select class="select selectBg" id="birthmm" name="birthmm" title="월 선택">
                                <option value="">월</option>
                                <c:forEach var="month" begin="1" end="12">
                                    <option value="${month}"
                                            <c:if test="${birthMonth == (month < 10 ? '0' + month : month)}">selected</c:if>>${month}월
                                    </option>
                                </c:forEach>
                            </select>


                            <select class="select selectBg" id="birthdd" name="birthdd" title="일 선택">
                                <option value="">일</option>
                                <c:forEach var="day" begin="1" end="31">
                                    <option value="${day}"
                                            <c:if test="${birthDay == (day < 10 ? '0' + day : day)}">selected</c:if>>${day}일
                                    </option>
                                </c:forEach>
                            </select>
                            <input type="hidden" name="email1" value="${email1}"/>
                            <input type="hidden" name="email2" value="${email2}">
                            <input type="hidden" name="idUser" value="${user.idUser}"/>
                            <input type="hidden" name="phone1" value="${phone1}">
                            <input type="hidden" name="phone2" value="${phone2}">
                            <input type="hidden" name="phone3" value="${phone3}">
                            <input type="hidden" name="address" value="${user.address}"/>
                            <button type="button" class="btn2" onclick="showModal('updateForm1')">수정</button>
                        </form>
                    </td>
                </tr>
                <tr>

                    <th>휴대전화</th>

                    <td td style="text-align: left">
                        <form id="updateForm2" action="/user/updateInfo" method="post">
                            <span class="selectboxWrap" style="width:80px">
                                <select class="select selectBg" id="phone1" name="phone1" title="휴대폰 번호 선택">
                                    <option value="010"
                                            <c:if test="${phone1 == '010'}">selected</c:if>>010</option>
                                    <option value="011"
                                            <c:if test="${phone1 == '011'}">selected</c:if>>011</option>
                                    <option value="016"
                                            <c:if test="${phone1 == '016'}">selected</c:if>>016</option>
                                    <option value="017"
                                            <c:if test="${phone1 == '017'}">selected</c:if>>017</option>
                                    <option value="018"
                                            <c:if test="${phone1 == '018'}">selected</c:if>>018</option>
                                    <option value="019"
                                            <c:if test="${phone1 == '019'}">selected</c:if>>019</option>
                                </select>
                            </span>
                            <span class="dash">-</span>
                            <input type="text" class="inTxt" id="phone2" name="phone2" maxlength="4" style="width:80px"
                                   title="휴대폰 두번째 자리 입력" value="${phone2}"/>
                            <span class="dash">-</span>
                            <input type="text" class="inTxt" id="phone3" name="phone3" maxlength="4" style="width:80px"
                                   title="휴대폰 세번째 자리 입력" value="${phone3}"/>

                            <input type="hidden" name="email1" value="${email1}"/>
                            <input type="hidden" name="email2" value="${email2}">
                            <input type="hidden" name="birthyy" value="${birthYear}">
                            <input type="hidden" name="birthmm" value="${birthMonth}">
                            <input type="hidden" name="birthdd" value="${birthDay}">
                            <input type="hidden" name="idUser" value="${user.idUser}"/>
                            <input type="hidden" name="address" value="${user.address}"/>
                            <input type="hidden" name="birth" value="${user.birth}"/>
                            <button type="button" class="btn2" onclick="showModal('updateForm2')">수정</button>
                        </form>
                    </td>
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td td style="text-align: left">
                        <form id="updateForm3" action="/user/updateInfo" method="post">
                            <input type="text"  class="inTxt" name="address" value="${user.address}" style="width: 350px;"/>
                            <input type="hidden" name="email1" value="${email1}"/>
                            <input type="hidden" name="email2" value="${email2}">
                            <input type="hidden" name="phone1" value="${phone1}">
                            <input type="hidden" name="phone2" value="${phone2}">
                            <input type="hidden" name="phone3" value="${phone3}">
                            <input type="hidden" name="idUser" value="${user.idUser}"/>
                            <input type="hidden" name="birthyy" value="${birthYear}">
                            <input type="hidden" name="birthmm" value="${birthMonth}">
                            <input type="hidden" name="birthdd" value="${birthDay}"/>
                            <input type="hidden" name="tel" value="${user.tel}"/>
                            <button type="button" class="btn2" onclick="showModal('updateForm3')">수정</button>
                        </form>
                    </td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td td style="text-align: left"><c:out value="${user.gender == 'M' ? '남성' : '여성'}"/></td>
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
                    정보가 변경되었습니다.

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="redirectToLogin()">확인</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function chgEmail(selectedValue) {
            var emailField = document.getElementById("email_02");

            if (selectedValue) {
                emailField.value = selectedValue;
                emailField.disabled = true;
            } else {
                emailField.value = "";
                emailField.disabled = false;
            }
        }

        function disableInput(selectValue) {
            var emailField = document.getElementById("email_02");
            var selectField = document.getElementById("email_03");

            if (selectValue) {
                emailField.disabled = true;
            } else {
                emailField.disabled = false;
            }
        }

        function disableSelect(inputValue) {
            var selectField = document.getElementById("email_03");

            if (inputValue) {
                selectField.disabled = true;
            } else {
                selectField.disabled = false;
            }
        }

        document.getElementById("email_02").addEventListener("input", function () {
            disableSelect(this.value);
        });

        document.getElementById("email_03").addEventListener("change", function () {
            disableInput(this.value);
        });

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
                    $('#confirmationModal').modal('hide');
                    if (response.success) {

                        $('#successModal').modal('show');
                    } else {
                        alert(response.error || '업데이트 중 오류가 발생했습니다.');
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                    alert('서버와의 통신 중 오류가 발생했습니다. 다시 시도해 주세요.');
                    $('#confirmationModal').modal('hide');
                }
            });
        }

        function redirectToLogin() {
            window.location.href = '/user/info';
        }
    </script>


</div>
</body>
</html>
