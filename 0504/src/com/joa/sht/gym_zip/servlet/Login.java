package com.joa.sht.gym_zip.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.SendResult;
import javax.websocket.Session;

import com.joa.sht.gym_zip.dao.MemberDAO;
import com.joa.sht.gym_zip.vo.Member;

@WebServlet("/login.do")
public class Login extends HttpServlet{

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		Member loginMember = MemberDAO.selectLogin(new Member(email,password));
		
		HttpSession session =req.getSession();

		if(loginMember==null) {
			//로그인 실패
			session.setAttribute("msg", "존재하지않는 이메일이거나 비밀번호가 틀렸습니다.");
			System.out.println("실패!");
			resp.sendRedirect("/login.jsp");
		}else {
			//로그인 성공
			session.setAttribute("loginMember", loginMember);
			System.out.println("상떼");
			//메인으로 보내기
			resp.sendRedirect("/main.jsp");
			
		}//if~else end
		
	
		
	}
}
