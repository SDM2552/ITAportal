<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/common.css">
<div id="header">
    <!-- hgroup -->
    <div class="hgroup">
        <h1 class="logo"><a href="/">국제무역아카데미 로고</a></h1>
        <!-- headUtil -->
        <div class="headerF">
            <div class="util">
                <!-- util -->
                <c:choose>
                <c:when test="${not empty sessionScope.loginUser}">
                    ${loginUser.name} 님 환영합니다.
                    <a href="/user/logout">로그아웃</a>
                </c:when>
                <c:otherwise>
                <a href="/user/signUp">회원가입</a>
                <a href="/user/loginPage">로그인</a>
                </c:otherwise>
                </c:choose>
                <a href="#">사이트맵</a>

                <!-- util -->
            </div>
        </div>
    </div>

    <!-- //hgroup -->
    <!-- gnb -->
    <div class="gnbArea">
        <div class="gnbInner">
            <div id="gnb">
                <ul class="gnbDep1">
                    <!-- role에 따라 메뉴 다르게 표시 -->
                    <c:choose>
                    <c:when test="${sessionScope.loginUser.role eq 'stu'}">
                    <!-- 학생 -->
                        <li>
                            <a href="/user/info" class="logincheck">MY</a>
                        </li>
                        <li>
                            <a href="/stu/myProgram" class="logincheck">수업</a>
                        </li>
                        <li>
                            <a href="/program/list">수강 신청</a>
                        </li>
                        <li>
                            <a href="/notice/noticeList">커뮤니티</a>
                        </li>
                    </c:when>
                    <c:when test="${sessionScope.loginUser.role eq 'prof'}">
                    <!-- 강사 -->
                        <li>
                            <a href="/user/info" class="logincheck">MY</a>
                        </li>
                        <li>
                            <a href="/prof/list" class="logincheck">강의 관리</a>
                        </li>
                        <li>
                            <a href="/notice/noticeList">커뮤니티</a>
                        </li>
                    </c:when>
                    <c:when test="${sessionScope.loginUser.role eq 'admin'}">
                    <!-- 관리자 -->
                        <li>
                            <a href="/user/info" class="logincheck">MY</a>
                        </li>
                        <li>
                            <a href="/adminProgram" class="logincheck">콘텐츠 관리</a>
                        </li>
                        <li>
                            <a href="/courseStatus/list" class="logincheck">신청 관리</a>
                        </li>
                        <li>
                            <a href="/admin/studentList" class="logincheck">회원 관리</a>
                        </li>
                        <li>
                            <a href="/notice/noticeList">커뮤니티</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                    <!-- 비회원 -->
                        <li>
                            <a href="/my" class="logincheck">MY</a>
                        </li>
                        <li>
                            <a href="/classes" class="logincheck">수업</a>
                        </li>
                        <li>
                            <a href="/program/list">수강 신청</a>
                        </li>
                        <li>
                            <a href="/notice/noticeList">커뮤니티</a>
                        </li>
                    </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
    <!-- //gnb -->
</div>