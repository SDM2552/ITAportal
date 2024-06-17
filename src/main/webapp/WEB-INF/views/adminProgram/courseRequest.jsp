<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/checkSession.js" defer></script>
    <title>강좌개설의뢰</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp"/>

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_admin_notice.jsp"/>
        <!-- contents -->
        <div id="contents" class="noticesListCont">
            <!-- location -->
            <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
            <span>공지사항 <i class="fa-solid fa-angle-right"></i></span><span class="on"> 강좌개설의뢰</span>
            <!-- //location -->

            <h3 class="pgTit">강좌개설의뢰</h3>

            <!-- 본문 -->
            <h4 class="subTit">강좌개설의뢰</h4>


                <input type="hidden" id="idNotice" name="idNotice" value=""/>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tbody class="mid">
                    <tr>
                        <th scope="col">제목</th>
                        <td colspan="3">
                            <input type="text" placeholder="제목을 입력하세요."id="title" name="title" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">신청자</th>
                        <td>
                            <input type="text" placeholder="이름"id="name" name="name" value=""/>
                        </td>
                        <th scope="col">이메일</th>
                        <td>
                            <input type="text" placeholder="연락받을 이메일을 입력하세요."id="email" name="email" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">내용</th>
                        <td colspan="3">
                            <textarea placeholder="내용을 입력하세요."id="content" name="content"></textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
                ※ 강좌개설의뢰는 피드백이 없습니다.
                <div class="btnArea">
                    <button type="button" class="btns btnSt01" onclick="sendRequest()">
                        <span>보내기</span>
                    </button>
                    <button type="button" class="btns btnSt02" onclick="history.back();">
                        <span>목록으로</span>
                    </button>
                </div>



            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp"/>
</div>
<script type="text/javascript">
    function sendRequest() {
        alert('강좌개설의뢰를 보냈습니다.\n강좌개설의뢰는 피드백이 없습니다.');
        location.href = '/notice/noticeList';
    }
</script>
</body>
</html>
