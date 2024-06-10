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
<div id="footer">
    <!-- footerArea -->
    <div class="footerArea">
        <!-- Floating Button and Menu -->
        <div class="floating-btn" onclick="toggleMenu()">
            <span id="toggleIcon" class="toggle-icon">+</span>
        </div>
        <div class="floating-menu" id="floatingMenu">
            <button class="footer-menu-btn" id="messageButton" onclick="showMessages()">
                <img src="/image/message_icon_closed.png" alt="쪽지" id="messageIcon" class="menu-icon closed">
            </button>

            <button class="footer-menu-btn" id="kakaoButton" onclick="showKakaoForm()">
                <img src="/image/kakao_icon.png" alt="카카오톡" id="kakaoIcon" class="menu-icon closed">
            </button>
        </div>
    </div>
    <!-- //footerArea -->
</div>

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

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var menu = document.getElementById('floatingMenu');
        menu.style.display = 'none'; // 페이지 로드 시 메뉴를 닫힌 상태로 유지
    });

    function toggleMenu() {
        var menu = document.getElementById('floatingMenu');
        var toggleIcon = document.getElementById('toggleIcon');
        if (menu.style.display === 'block') {
            menu.style.display = 'none';
            toggleIcon.innerText = '+';
        } else {
            menu.style.display = 'block';
            toggleIcon.innerText = '-';
        }
    }

    function showMessages() {
        var modal = document.getElementById('modal');
        var modalTitle = document.getElementById('modalTitle');
        var modalContent = document.getElementById('modalContent');
        modalTitle.innerText = '메신저';
        modalContent.innerHTML = '<iframe src="/messenger/list" width="100%" height="100%" frameborder="0"></iframe>';
        modal.style.display = 'block';
    }

    function showKakaoForm() {
        var modal = document.getElementById('modal');
        var modalTitle = document.getElementById('modalTitle');
        var modalContent = document.getElementById('modalContent');
        modalTitle.innerText = '카카오톡 메시지 전송';
        modalContent.innerHTML = '<iframe src="/kakao/form" width="100%" height="100%" frameborder="0"></iframe>';
        modal.style.display = 'block';
    }

    function showModal(title) {
        var modal = document.getElementById('modal');
        var modalTitle = document.getElementById('modalTitle');
        var modalContent = document.getElementById('modalContent');
        modalTitle.innerText = title;

        // 데스크탑일 때 모달 창을 띄우고, 모바일일 때는 페이지 이동
        if (window.innerWidth > 768) {
            modalContent.innerHTML = '<iframe src="/messenger/list" width="100%" height="100%" frameborder="0"></iframe>';
            modal.style.display = 'block';
        } else {
            window.location.href = '/messenger/list';
        }
    }

    function closeModal() {
        var modal = document.getElementById('modal');
        modal.style.display = 'none';
    }

    document.getElementById('messageButton').addEventListener('mouseover', function() {
        document.getElementById('messageIcon').src = '/image/message_icon_open.png';
    });

    document.getElementById('messageButton').addEventListener('mouseout', function() {
        document.getElementById('messageIcon').src = '/image/message_icon_closed.png';
    });
</script>

