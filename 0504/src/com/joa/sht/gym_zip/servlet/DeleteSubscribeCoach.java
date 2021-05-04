package com.joa.sht.gym_zip.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joa.sht.gym_zip.dao.SubscribeDAO;


@WebServlet("/deleteSubscribeCoach.joa")
public class DeleteSubscribeCoach extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String noStr = req.getParameter("no");
		
		int no = Integer.parseInt(noStr);
		
		int result = SubscribeDAO.deleteSubscribeCoach(no);
		
		resp.sendRedirect("/training_room.jsp");
		
	
	}
}
