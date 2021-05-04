package com.joa.sht.gym_zip.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.joa.sht.gym_zip.dao.MemberDAO;

@WebServlet("/ajax/checkEmail.json")
public class CheckEmail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 넘어온 파라미터 email 받기
				String email=req.getParameter("email");
		
				System.out.println(email);
				
				
				

				// json으로 응답하려면 어떻게 해야 하나요 
				// Content-Type 지정 그리고 실제 모양도 json 형태 여야 한다. 
				
				
				resp.setContentType("application/json;charset=UTF-8");
				
				
				
				PrintWriter out=resp.getWriter();
				
				boolean result= MemberDAO.checkEmail(email)==1;
				
				
				
				
				
				
				out.print("{\"result\":"+result+"}");
	}
}
