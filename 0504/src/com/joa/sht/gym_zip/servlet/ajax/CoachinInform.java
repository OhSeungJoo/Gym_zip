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

@WebServlet("/coachingInform.json")
public class CoachinInform extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
		String coachNoStr = req.getParameter("coachNo");
		String coachingDateStr = req.getParameter("coachingDate");
		
		int coachNo = Integer.parseInt(coachNoStr);
		Timestamp coachingDate = Timestamp.valueOf(coachingDateStr);
		
		
		Coaching result =CoachingDAO.CoachingInfor(new Coaching(coachNo, coachingDate));
		
		PrintWriter out=resp.getWriter();
		ObjectMapper om = new ObjectMapper();
		String jsonStr = om.writeValueAsString(result);
		out.print(jsonStr);
		
	
	}
}
