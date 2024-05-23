<%--<div id="footer">--%>
<%--    <hr>--%>
<%--    <!-- footerArea -->--%>
<%--    <div class="footerArea">--%>
<%--        <!-- Footer 내용 추가 -->--%>
<%--        <p>이것은 Footer입니다. 여기에 추가적인 정보나 링크를 넣을 수 있습니다.</p>--%>
<%--    </div>--%>
<%--    <!-- //footer -->--%>
<%--</div>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 모달 창 -->
<div class="modal" id="modal">
    <div class="modal-header">
        <h2 id="modalTitle"></h2>
        <span class="modal-close" onclick="closeModal()">&times;</span>
    </div>
    <div class="modal-content" id="modalContent">
        <!-- 모달 내용이 여기에 표시됩니다. -->
    </div>
</div>

<!-- 푸터 -->
<div id="footer">
    <hr>
    <div class="footerArea">
        <p>이것은 Footer입니다. 여기에 추가적인 정보나 링크를 넣을 수 있습니다.</p>

<%--        메신저기능 일단 비활성화--%>
<%--        <div class="footer-btn" onclick="toggleFooterMenu()">+</div>--%>
<%--        <div id="footerMenu" class="footer-menu">--%>
<%--            <button class="footer-menu-btn" onclick="showMessengerListModal()">메신저</button>--%>
<%--&lt;%&ndash;            <button class="footer-menu-btn" onclick="promptAndSendSMS()">문자</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <button class="footer-menu-btn" onclick="promptAndSendKakaoTalk()">카카오톡</button>&ndash;%&gt;--%>
<%--        </div>--%>
    </div>
</div>

<!-- 모달 스크립트와 푸터 스크립트 -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var menu = document.getElementById('footerMenu');
        menu.style.display = 'none'; // 페이지 로드 시 메뉴를 닫힌 상태로 시작
    });

    function toggleFooterMenu() {
        var menu = document.getElementById('footerMenu');
        if (menu.style.display === 'block') {
            menu.style.display = 'none';
        } else {
            menu.style.display = 'block';
        }
    }

    function showMessengerListModal() {
        showModal('메신저 리스트', '/messenger/list');
    }

    function promptAndSendSMS() {
        var phoneNumber = prompt("받는 사람의 전화번호를 입력하세요:");
        if (phoneNumber) {
            var message = prompt("문자 메시지를 입력하세요:");
            if (message) {
                alert("문자 메시지가 전송되었습니다.");
            }
        }
    }

    function promptAndSendKakaoTalk() {
        var kakaoId = prompt("카카오톡 ID를 입력하세요:");
        if (kakaoId) {
            var message = prompt("카카오톡 메시지를 입력하세요:");
            if (message) {
                alert("카카오톡 메시지가 전송되었습니다.");
            }
        }
    }

    function showModal(title, url) {
        var modal = document.getElementById('modal');
        var modalTitle = document.getElementById('modalTitle');
        var modalContent = document.getElementById('modalContent');
        modalTitle.innerText = title;

        if (window.innerWidth > 768) {
            modalContent.innerHTML = '<iframe src="' + url + '" width="100%" height="100%" frameborder="0"></iframe>';
            modal.style.display = 'block';
        } else {
            window.location.href = url;
        }
    }

    function closeModal() {
        var modal = document.getElementById('modal');
        modal.style.display = 'none';

        var footerMenu = document.getElementById('footerMenu');
        if (footerMenu.style.display === 'block') {
            footerMenu.style.display = 'none';
        }
    }
</script>
