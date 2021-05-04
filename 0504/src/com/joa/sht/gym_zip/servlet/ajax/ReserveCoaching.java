package com.joa.sht.gym_zip.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.joa.sht.gym_zip.dao.CoachingDAO;
import com.joa.sht.gym_zip.vo.Coaching;

@WebServlet("/reserveCoaching.json")
public class ReserveCoaching extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
		String memberNoStr = req.getParameter("memberNo");
		int memberNo = Integer.parseInt(memberNoStr);
		
		System.out.println(memberNo);

		String coachNoStr = req.getParameter("coachNo");
		int coachNo = Integer.parseInt(coachNoStr);
		
		System.out.println(coachNo);
		
		String startDateStr = req.getParameter("startDate");

		
		Timestamp coachingDate = Timestamp.valueOf(startDateStr);
		
		System.out.println(startDateStr);
		
		
		Coaching coaching = new Coaching(memberNo, coachNo, coachingDate);
		
		int result = CoachingDAO.reserveCoaching(coaching);
		
		PrintWriter out=resp.getWriter();
		ObjectMapper om = new ObjectMapper();
		String jsonStr = om.writeValueAsString(result);
		out.print(jsonStr);
		
	}
}
