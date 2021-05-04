package com.joa.sht.gym_zip.filter;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({
	"/training_room.jsp",
	"/coach_mypage.jsp"
	})
public class LoginCheck implements Filter{
	
	//필터인터페이스가 갖고있는 추상메서드가 없어서
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		//HttpServletRequest객체로 강제 형변환
		//세션을 얻어옴
		HttpSession session = ((HttpServletRequest)request).getSession();
		
		Object logingMember = session.getAttribute("loginMember");
		
		if(logingMember==null) {
			
			session.setAttribute("msg", "로그인을 해주세요");
			
			((HttpServletResponse)response).sendRedirect("/login.jsp");
		}else {
			//로그인이 되었으면 해당 페이지 or 서블릿으로 이동
			chain.doFilter(request, response);
		}
		
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
	
}
