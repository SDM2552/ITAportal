document.addEventListener("DOMContentLoaded", function() {
    document.body.addEventListener("click", function(event) {
        if (event.target.matches("a.logincheck, button.logincheck")) {
            event.preventDefault();
            const url = event.target.getAttribute("href");
            const programId = event.target.getAttribute("data-program-id");
            checkSessionAndRedirect(url, programId, event);
        }
    });
});

function checkSessionAndRedirect(url, programId, event) {
    fetch('/api/checkSession', {
        method: 'GET',
        credentials: 'include'
    })
        .then(response => response.json())
        .then(data => {
            console.log(data);
            if (data.isLoggedIn) {
                if (programId) {
                    applyProgram(programId, event);
                } else if (url) {
                    window.location.href = url;
                }
            } else {
                if (confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")) {
                    window.location.href = "/user/loginPage";
                }
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
}


