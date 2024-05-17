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
    <title>샘플 페이지</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header_admin.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_member.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈">홈으로 이동</span>
                <span>수강 내역 조회</span>
                <span class="on">ㅁㄴㅇㅁㄴㅇ</span>
            </div>
            <!-- //location -->

            <h3 class="pgTit"><a href="javascript:history.go(-1);" class="prev">이전</a>강사 등록</h3>

            <!-- 본문 -->
            <form action="professorSignUp" method="post">
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
                        <th scope="row"><label for=phone1>휴대폰</label><span class="essR">필수</span></th>
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
                            <input type="text" class="inTxt rs-w45" id="email_02" name="email2"
                                   onFocus="checkLen(this.value);" onBlur="checkMail(this.value);"
                                   style="width:120px;ime-mode:disabled;" title="이메일 입력" />
                            <span class="selectboxWrap" style="width:180px">
                            <label for="email_03" class="disn">이메일 선택</label>
                            <select class="select selectBg" id="email_03" name="email2"
                                    onchange="chgEmail(this.value, this.selectedIndex);" title="이메일 선택">
                                <option value="">직접입력</option>

                                <option value="gmail.com">
                                    <span class='txt2'>gmail.com</span>
                                </option>
                                <option value="kakao.com">
                                    <span class='txt2'>kakao.com</span>
                                </option>
                                <option value="naver.com">
                                    <span class='txt2'>naver.com</span>
                                </option>
                                <option value="nate.com">
                                    <span class='txt2'>nate.com</span>
                                </option>
                                <option value="yahoo.co.kr">
                                    <span class='txt2'>yahoo.co.kr</span>
                                </option>

                            </select>
                        </span>
                        </td>
                    <tr>
                        <th scope="row"><label for="m_szPwdChk">주소</label></th>
                        <td colspan="3" class="line2"><input type="text" class="inTxt rs-w100"
                                                             name="address" maxlength="50" style="width:180px;ime-mode:disabled;" title="주소">
                        </td>
                    </tr>
                    </tr>
                    </tbody>
                </table>

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
            </form>


            <script>
                function restrictToNumbers(inputField) {
                    // 입력 필드의 현재 값 가져오기
                    var inputValue = inputField.value;
                    // 숫자가 아닌 문자 제거 (정규 표현식을 사용)
                    var numericValue = inputValue.replace(/[^0-9]/g, '');
                    // 입력 필드에 숫자만 남기기
                    inputField.value = numericValue;
                }
                document.addEventListener("DOMContentLoaded", function () {
                    const years = document.getElementById("birthyy");
                    const months = document.getElementById("birthmm");
                    const days = document.getElementById("birthdd");

                    // 년도 추가
                    for (let year = new Date().getFullYear(); year >= 1900; year--) {
                        let option = document.createElement("option");
                        option.value = year;
                        option.text = year + "년";
                        years.appendChild(option);
                    }

                    // 월 추가
                    for (let month = 1; month <= 12; month++) {
                        let option = document.createElement("option");
                        option.value = month < 10 ? '0' + month : month;
                        option.text = month + "월";
                        months.appendChild(option);
                    }
                    // 일 추가 함수
                    function populateDays(year, month) {
                        // 기존의 일 옵션 제거
                        while (days.firstChild) {
                            days.removeChild(days.firstChild);
                        }
                        // 기본 일 옵션 추가
                        let defaultOption = document.createElement("option");
                        defaultOption.value = "";
                        defaultOption.text = "일";
                        days.appendChild(defaultOption);

                        // 선택된 년도와 월에 따라 일 추가
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

                    // 년도와 월이 변경될 때 일 옵션 갱신
                    years.addEventListener("change", function () {
                        populateDays(years.value, months.value);
                    });
                    months.addEventListener("change", function () {
                        populateDays(years.value, months.value);
                    });
                });


            </script>
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>
</body>

</html>