<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>회원 가입</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="/WEB-INF/views/layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_signUp.jsp"/>
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span class="on"> 회원 가입</span>
            <!-- //location -->

            <h3 class="pgTit">회원 가입</h3>

            <!-- 본문 -->
            <form action="signUpCheck" method="post" onsubmit="return validateAndSubmit();">
                <div class="tblForm inputForm mt10">
                    <table>
                        <colgroup>
                            <col style="width:160px">
                            <col style="width:280px">
                            <col style="width:100px">
                            <col class="sm-wd">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">성명<span class="essR">필수</span></th>
                            <td colspan="3">
                                <input type="text" class="inTxt rs-w100" id="m_szName" name="name" value="" maxlength="50"
                                       style="width:180px" title="성명 입력">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">아이디<span class="essR">필수</span></th>
                            <td colspan="3">
                                <input type="text" class="inTxt rs-w100" id="m_szId" name="loginId" maxlength="20"
                                       style="width:180px;ime-mode:disabled;" title="아이디 입력">
                                <label for="m_szId"><a href="javascript:DupWebIdCheck();" class="tbtns rs-mt5"
                                                       title="중복확인">중복확인</a></label>
                                <div id="idMessage" style="display: none; color: red; margin-top: 5px;"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="m_szPwd">비밀번호</label><span class="essR">필수</span></th>
                            <td colspan="3"><input type="password" class="inTxt rs-w100" id="m_szPwd" name="password"
                                                   maxlength="14" style="width:180px;ime-mode:disabled;" title="비밀번호">

                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="m_szPwdChk">비밀번호 확인</label><span class="essR">필수</span></th>
                            <td colspan="3" class="line2"><input type="password" class="inTxt rs-w100" id="m_szPwdChk"
                                                                 name="passwordck" maxlength="14" style="width:180px;ime-mode:disabled;" title="비밀번호 확인">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="birthyy">생년월일</label><span class="essR">필수</span></th>
                            <td>
                        <span class="selectboxWrap" style="width:32%">
                            <select class="select selectBg" id="birthyy" name="birthyy" title="년도 선택">
                                <option value="">년도</option>
                            </select>
                        </span>
                                <span class="selectboxWrap" style="width:32%">
                            <select class="select selectBg" id="birthmm" name="birthmm" title="월 선택">
                                <option value="">월</option>
                            </select>
                        </span>
                                <label for="birthmm" class="disn">월</label>
                                <span class="selectboxWrap" style="width:32%">
                            <select class="select selectBg" id="birthdd" name="birthdd" title="일 선택">
                                <option value="">일</option>
                            </select>
                        </span>
                                <label for="birthdd" class="disn">일</label>
                            </td>
                            <th scope="row">성별</th>
                            <td>
                        <span class="radioWrap">
                            <label><input type="radio" class="ra" id="genderM" name="gender" value="M" />남</label>
                            <label><input type="radio" class="ra" id="genderF" name="gender" value="F" />여</label>
                        </span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="phone1">휴대폰</label><span class="essR">필수</span></th>
                            <td colspan="3" class="hp">
                        <span class="selectboxWrap" style="width:80px">
                            <select class="select selectBg" id="phone1" name="phone1" title="휴대폰 번호 선택">
                                <option value="010" selected="selected">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                        </span>
                                <span class="dash">-</span>
                                <input type="text" class="inTxt" id="phone2" name="phone2" maxlength="4"
                                       oninput="restrictToNumbers(this)" style="width:80px" title="휴대폰 두번째 자리 입력" />
                                <span class="dash">-</span>
                                <input type="text" class="inTxt" id="phone3" name="phone3" maxlength="4"
                                       oninput="restrictToNumbers(this)" style="width:80px" title="휴대폰 세번째 자리 입력" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="email_01">이메일</label><span class="essR">필수</span></th>
                            <td colspan="3" class="email">
                                <input type="hidden" name="m_szEmail" />
                                <input type="text" class="inTxt rs-w40" id="email_01" name="email01"
                                       onFocus="checkLen(this.value);" onBlur="checkMail(this.value);"
                                       style="width:120px;ime-mode:disabled;" title="이메일 아이디 입력" />
                                <span class="dash"> @ </span>
                                <label for="email_02" class="disn">이메일 입력</label>
                                <input type="text" class="inTxt rs-w45" id="email_02" name="email02"
                                       onFocus="checkLen(this.value);" onBlur="checkMail(this.value);"
                                       style="width:120px;ime-mode:disabled;" title="이메일 입력" />
                                <span class="selectboxWrap" style="width:180px">
                            <label for="email_03" class="disn">이메일 선택</label>
                            <select class="select selectBg" id="email_03" name="email03"
                                    onchange="chgEmail(this.value);" title="이메일 선택">
                                <option value="">직접입력</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="kakao.com">kakao.com</option>
                                <option value="naver.com">naver.com</option>
                                <option value="nate.com">nate.com</option>
                                <option value="yahoo.co.kr">yahoo.co.kr</option>
                            </select>
                        </span>
                            </td>
                        <tr>
                            <th scope="row"><label for="address">주소</label></th>
                            <td colspan="3" class="line2"><input type="text" class="inTxt rs-w100"
                                                                 name="address" maxlength="50" style="width:180px;ime-mode:disabled;" title="주소">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <input type="hidden" id="role" value="${role}" name="role">
                </div>
                <!-- //tblForm 정보입력 -->

                <!-- btn -->
                <div class="btnArea">
                    <button type="submit" class="btns btnSt01">
                        <span>등록</span>
                    </button>
                    <button type="button" class="btns btnSt02" onclick="history.back();">
                        <span>취소</span>
                    </button>
                </div>
                <!-- btn -->
                <div id="duplicatePopup" style="display:none; position: absolute; top: 50px; left: 50%; transform: translateX(-50%); background-color: white; padding: 10px; border: 1px solid gray; z-index: 999;">
                </div>
            </form>

            <script>
                // 숫자만 입력 가능하게 제한하는 함수
                function restrictToNumbers(inputField) {
                    var inputValue = inputField.value;
                    var numericValue = inputValue.replace(/[^0-9]/g, '');
                    inputField.value = numericValue;
                }

                // 년, 월, 일 옵션 추가
                document.addEventListener("DOMContentLoaded", function () {
                    const years = document.getElementById("birthyy");
                    const months = document.getElementById("birthmm");
                    const days = document.getElementById("birthdd");

                    for (let year = new Date().getFullYear(); year >= 1900; year--) {
                        let option = document.createElement("option");
                        option.value = year;
                        option.text = year + "년";
                        years.appendChild(option);
                    }

                    for (let month = 1; month <= 12; month++) {
                        let option = document.createElement("option");
                        option.value = month < 10 ? '0' + month : month;
                        option.text = month + "월";
                        months.appendChild(option);
                    }

                    function populateDays(year, month) {
                        while (days.firstChild) {
                            days.removeChild(days.firstChild);
                        }
                        let defaultOption = document.createElement("option");
                        defaultOption.value = "";
                        defaultOption.text = "일";
                        days.appendChild(defaultOption);

                        if (year && month) {
                            let daysInMonth = new Date(year, month, 0).getDate();
                            for (let day = 1; day <= daysInMonth; day++) {
                                let option = document.createElement("option");
                                option.value = day < 10 ? '0' + day : day;
                                option.text = day + "일";
                                days.appendChild(option);
                            }
                        }
                    }

                    years.addEventListener("change", function () {
                        populateDays(years.value, months.value);
                    });
                    months.addEventListener("change", function () {
                        populateDays(years.value, months.value);
                    });
                });

                // 중복 확인 버튼 클릭 시 실행되는 함수
                function DupWebIdCheck(callback) {
                    var loginId = document.getElementById("m_szId").value;
                    if (loginId.trim() === "") {
                        alert("아이디를 입력해주세요.");
                        if (callback) callback(false);  // 중복 확인 실패 콜백 호출
                        return;
                    }
                    $.ajax({
                        type: "GET",
                        url: "checkDuplicateId?loginId=" + loginId,
                        success: function (response) {
                            var idMessage = document.getElementById("idMessage");
                            if (response === "duplicate") {
                                idMessage.textContent = "이미 사용 중인 아이디입니다.";
                                idMessage.style.color = "red";
                                idMessage.style.display = "block";
                                if (callback) callback(false);  // 중복 확인 실패 콜백 호출
                            } else {
                                idMessage.textContent = "사용 가능한 아이디입니다.";
                                idMessage.style.color = "green";
                                idMessage.style.display = "block";
                                if (callback) callback(true);  // 중복 확인 성공 콜백 호출
                            }
                        },
                        error: function () {
                            alert("서버 오류가 발생했습니다.");
                            if (callback) callback(false);  // 서버 오류 콜백 호출
                        }
                    });
                }

                function validateAndSubmit() {
                    // 클라이언트 측 유효성 검사 로직 추가 (예: 비밀번호 확인 등)
                    if (!validateForm()) {
                        return false;
                    }

                    // 중복 확인 함수 호출 후 폼 제출 여부 결정
                    DupWebIdCheck(function(isValid) {
                        if (isValid) {
                            document.querySelector('form').submit(); // 중복 아이디가 아닌 경우, 폼 제출
                        } else {
                            alert('아이디 중복을 확인해주세요.'); // 중복 아이디인 경우, 경고 메시지
                        }
                    });

                    return false; // 비동기 중복 확인을 기다리기 위해 폼 제출을 일단 막음
                }

                // 이메일 옵션 변경 시 실행되는 함수
                function chgEmail(value) {
                    var email02 = document.getElementById("email_02");
                    if (value === "") {
                        email02.value = "";
                        email02.removeAttribute("readonly");
                    } else {
                        email02.value = value;
                        email02.setAttribute("readonly", "readonly");
                    }
                }

                // 폼 제출 전에 비밀번호와 필수 입력 필드를 확인
                function validateForm() {
                    var requiredFields = [
                        "m_szName", "m_szId", "m_szPwd", "m_szPwdChk",
                        "birthyy", "birthmm", "birthdd", "phone2", "phone3", "email_01", "email_02"
                    ];

                    for (var i = 0; i < requiredFields.length; i++) {
                        var field = document.getElementById(requiredFields[i]);
                        if (!field || field.value.trim() === "") {
                            alert("모든 필수 입력 필드를 채워주세요.");
                            field.focus();
                            return false;
                        }
                    }

                    var password = document.getElementById("m_szPwd").value;
                    var confirmPassword = document.getElementById("m_szPwdChk").value;
                    if (password !== confirmPassword) {
                        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                        return false;
                    }
                    return true;
                }
            </script>
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>
</body>
</html>
