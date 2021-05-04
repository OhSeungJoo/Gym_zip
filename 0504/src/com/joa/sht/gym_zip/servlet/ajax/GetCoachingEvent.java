package com.joa.sht.gym_zip.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.joa.sht.gym_zip.dao.CoachingDAO;
import com.joa.sht.gym_zip.vo.Coaching;
import com.joa.sht.gym_zip.vo.Event;

@WebServlet("/getCoachingEvents.json")
public class GetCoachingEvent extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
		
		String calendarStartStr = req.getParameter("calendarStart");
		String calendarEndStr= req.getParameter("calendarEnd");
		
		
		Timestamp calendarStart = Timestamp.valueOf(calendarStartStr);
		Timestamp calendarEnd = Timestamp.valueOf(calendarEndStr);
		
		System.out.println(calendarStart+"나야");
		System.out.println(calendarEnd);
		
		String coachNoStr = req.getParameter("coachNo");
		int coachNo = Integer.parseInt(coachNoStr);
		
		System.out.println(coachNo);
		Coaching coaching = new Coaching(coachNo, calendarStart, calendarEnd);
		
		List<Coaching> list = CoachingDAO.getCoachingEvent(coaching);
		
		List<Event> events = new ArrayList<Event>();
		for (Coaching coaching2 : list) {
			
			events.add(new Event(coaching2.getNickname(),coaching2.getCoachingDate(), "C",coaching2.getOkToggle()));
		}
		
		PrintWriter out=resp.getWriter();
		ObjectMapper om = new ObjectMapper();
		
		String jsonStr = om.writeValueAsString(events);
		System.out.println(jsonStr);
		
		out.print(jsonStr);
	
	}
}
