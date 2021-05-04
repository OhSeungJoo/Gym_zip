package com.joa.sht.gym_zip.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//필터가 적용될 곳을 지정, 여러곳을 지정하려면 배열{}처럼 사용
@WebFilter("/*")
public class EncodingFilter implements Filter{
	//필터인터페이스가 가진 인터페이스를 구현하지 않아서
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("EncodingFilter init!");
	}
	@Override
	public void destroy() {
		
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//post방식의 한글처리
		request.setCharacterEncoding("UTF-8");
		
		//연결해주지않으면 작동하지않음
		chain.doFilter(request, response);
	}
	
}
