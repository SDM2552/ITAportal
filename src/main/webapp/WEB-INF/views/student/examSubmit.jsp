<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://kit.fontawesome.com/93205cc57d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>샘플 페이지</title>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <c:import url="../layout/header.jsp" />

    <!-- container -->
    <div id="container" class="container responCont">
        <!-- 왼쪽 네비바 -->
        <c:import url="../layout/nav_student.jsp" />
        <!-- contents -->
        <div id="contents" class="eduIntroCont">
            <!-- location -->
            <div class="location">
                <span class="home" title="홈"><i class="fa-solid fa-house"></i> <i class="fa-solid fa-angle-right"></i></span>
                <span>수업 <i class="fa-solid fa-angle-right"></i> </span><span>과제 제출 </span>
            </div>
            <!-- //location -->

            <h3 class="pgTit">과제 제출</h3>

            <!-- 본문 -->
            <h4 class="subTit">과제 제출</h4>
            <form method="post" enctype="multipart/form-data" action="/stu/submitExam" onsubmit="return validateFile()">
                <input type="hidden" name="idExam" value="${examDetail.idExam}"/>
                <input type="hidden" name="idProgram" value="${examDetail.idPgm}"/>
            <div class="tblData mt10">
                <table>
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="col">프로그램</th>
                        <td>
                            ${examDetail.programName}
                        </td>
                        <th scope="col">담당 강사</th>
                        <td>
                            ${examDetail.profName}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">과제</th>
                        <td colspan="3">
                            ${examDetail.name}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">과제 내용</th>
                        <td colspan="3">
                            ${examDetail.description}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">제출 기한</th>
                        <td>
                            ${examDetail.startDate} ~ ${examDetail.endDate}
                        </td>
                        <th scope="col">파일 첨부</th>
                        <td>
                            <div class="fileBox">
                                <input type="file" id="examFile" name="examFile" onchange="validateFile()">
                                <div id="fileSizeDisplay"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>

                    </tr>
                    </tbody>
                </table>
            </div>
            <!-- btn -->
            <div class="btnArea">
                <button type="submit" class="btns btnSt01">
                    <span>제출</span>
                </button>
                <button type="button" class="btns btnSt02" onclick="history.back();">
                    <span>취소</span>
                </button>
            </div>
            </form>
            <!-- btn -->
            <!-- 본문 끝 -->
        </div>
        <!-- //contents -->
    </div>

    <!-- footer -->
    <c:import url="../layout/footer.jsp" />
</div>
<script type="text/javascript">
    function validateFile() {
        const fileInput = document.getElementById('examFile');
        const fileSizeDisplay = document.getElementById('fileSizeDisplay');
        const file = fileInput.files[0];

        if (!file) {
            alert('파일이 첨부되지 않았습니다.');
            return false;
        }

        // Check file extension
        const allowedExtensions = ['txt'];
        const fileExtension = file.name.split('.').pop().toLowerCase();
        if (!allowedExtensions.includes(fileExtension)) {
            alert('.txt 파일만 첨부할 수 있습니다.');
            fileInput.value = ''; // Clear the file input
            fileSizeDisplay.textContent = '';
            return false;
        }

        if (file) {
            const fileSize = file.size / 1024 / 1024; // in MB
            fileSizeDisplay.textContent = '파일 용량: ' + fileSize.toFixed(2) + ' MB';

            const maxSize = 2; // 파일 최대 용량 MB
            if (fileSize > maxSize) {
                alert('파일 용량은 ' + maxSize + ' MB 미만이어야 합니다.');
                fileInput.value = ''; // Clear the file input
                fileSizeDisplay.textContent = '';
                return false;
            }
        }
        return true;
    }
</script>
</body>

</html>