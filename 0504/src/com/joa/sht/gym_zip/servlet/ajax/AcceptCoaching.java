package com.joa.sht.gym_zip.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.joa.sht.gym_zip.dao.CoachingDAO;
import com.joa.sht.gym_zip.vo.Coaching;

@WebServlet("/acceptCoaching.json")
public class AcceptCoaching extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String coachingDateStr = req.getParameter("coachingDate");
		String coachNoStr = req.getParameter("coachNo");
		
		int coachNo = Integer.parseInt(coachNoStr);
		Timestamp coachingDate = Timestamp.valueOf(coachingDateStr);
		
		System.out.println(coachNo);
		System.out.println(coachingDate);
		
		Coaching coaching = new Coaching(coachNo, coachingDate);
		
		System.out.println(coaching);
		
		int result = CoachingDAO.acceptCoaching(coaching);
		
		System.out.println(result);
		
		PrintWriter out=resp.getWriter();
		ObjectMapper om = new ObjectMapper();
		String jsonStr = om.writeValueAsString(result);
		out.print(jsonStr);
	}
	
}
