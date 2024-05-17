package com.izo.itaportal.interceptor;

import com.izo.itaportal.model.LoginResponse;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        // 1. 세션에서 회원 정보 조회
        HttpSession session = request.getSession();
        LoginResponse user = (LoginResponse) session.getAttribute("loginUser");

        // 2. 회원 정보 체크
        if (user == null) {
            response.sendRedirect("/sample3");
            return false;
        }

        return HandlerInterceptor.super.preHandle(request, response, handler);
    }

}
