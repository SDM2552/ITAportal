<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강의계획서 입력</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h3>강의계획서 입력</h3>
    <div>
        <!-- 강의 정보 테이블 -->
        <table>
            <caption>강의 정보</caption>
            <tbody>
            <tr>
                <th><label for="category">카테고리<br>(Category)</label></th>
                <td><div id="category" class="form-control"></div></td>
                <th><label for="programTitle">교과목명<br>(Program Title)</label></th>
                <td><div id="programTitle" class="form-control"></div></td>
            </tr>
            <tr>
                <th><label for="classRoom">수업시간/강의실<br>(Class Time/Class Room)</label></th>
                <td><div id="classRoom" class="form-control"></div></td>
                <th><label for="programDuration">강의기간<br>(Program Duration)</label></th>
                <td><div id="programDuration" class="form-control"></div></td>
            </tr>
            <tr>
                <th><label for="profName">교수 성명<br>(Professor Name)</label></th>
                <td><div id="profName" class="form-control"></div></td>
                <th><label for="email">E-mail</label></th>
                <td><div id="email" class="form-control"></div></td>
            </tr>
            </tbody>
        </table>
    </div>

    <!-- 강의 정보 입력 폼 -->
    <form>
        <div class="form-group">
            <label for="lectureName">강의명:</label>
            <input type="text" class="form-control" id="lectureName" value="두둥탁" readonly >
        </div>
        <div class="form-group">
            <label for="teaching">강의방식</label>
            <select class="form-control" id="teaching">
                <option value="online">온라인</option>
                <option value="offline">오프라인</option>
            </select>
        </div>
        <div class="form-group">
            <label for="lectureTime">강의 시간:</label>
            <input type="text" class="form-control" id="lectureTime" placeholder="강의 시간 입력">
        </div>
        <div class="form-group">
            <label for="book">교재 및 참고 자료:</label>
            <input type="text" class="form-control" id="book" placeholder="교재 및 참고 자료 입력">
        </div>
        <div class="form-group">
            <label for="courseOverview">교과목 개요:</label>
            <textarea class="form-control" id="courseOverview" rows="5" placeholder="강의 개요 입력"></textarea>
        </div>
        <div class="form-group">
            <label for="classObjective">수업 목표:</label>
            <textarea class="form-control" id="classObjective" rows="3" placeholder="수업 목표 입력"></textarea>
        </div>
        <div class="form-group">
            <label for="evaluation">평가 방법:</label>
            <textarea class="form-control" id="evaluation" rows="3" placeholder="평가 방법 입력"></textarea>
        </div>
        <div class="form-group">
            <label for="remarks">비고</label>
            <textarea class="form-control" id="remarks" rows="3" placeholder="기타 메모사항 입력"></textarea>
        </div>
        <input type="hidden" id="idProf" value="#">
        <button type="submit" class="btn btn-primary">저장</button>
    </form>
</div>
</body>
</html>