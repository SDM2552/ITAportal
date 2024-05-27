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
    <hr>
    <!-- footerArea -->
    <div class="footerArea">
        <!-- Floating Button and Menu -->
        <div class="floating-btn" onclick="toggleMenu()">
            <span>+</span>
        </div>
        <div class="floating-menu" id="floatingMenu">
            <button class="footer-menu-btn" onclick="showModal('쪽지')">쪽지</button>
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
    var isShowingReceivedMessages = true;

    document.addEventListener("DOMContentLoaded", function() {
        var menu = document.getElementById('floatingMenu');
        menu.style.display = 'none'; // 페이지 로드 시 메뉴를 닫힌 상태로 유지
    });

    function toggleMenu() {
        var menu = document.getElementById('floatingMenu');
        if (menu.style.display === 'block') {
            menu.style.display = 'none';
        } else {
            menu.style.display = 'block';
        }
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
</script>


