package com.joa.sht.gym_zip.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.joa.sht.gym_zip.dao.CoachingDAO;
import com.joa.sht.gym_zip.dao.ExRecordDAO;
import com.joa.sht.gym_zip.vo.Coaching;
import com.joa.sht.gym_zip.vo.Event;
import com.joa.sht.gym_zip.vo.ExRecord;

@WebServlet("/getCalenderEvents.json")
public class GetCalendarEvent extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
		
		String calendarStartStr = req.getParameter("calendarStart");
		String calendarEndStr= req.getParameter("calendarEnd");
		
		
		Timestamp calendarStart = Timestamp.valueOf(calendarStartStr);
		Timestamp calendarEnd = Timestamp.valueOf(calendarEndStr);
		
		String memberNoStr = req.getParameter("memberNo");
		int memberNo = Integer.parseInt(memberNoStr);
		
		
		System.out.println(calendarStart);
		System.out.println(calendarEnd);
		System.out.println(memberNo);

		ExRecord exRecord = new ExRecord(memberNo, calendarStart, calendarEnd);
		Coaching coaching = new Coaching(calendarStart, calendarEnd, memberNo);
		
		List<ExRecord> list = ExRecordDAO.getExRecord(exRecord);
		List<Coaching> coachingList = CoachingDAO.getCoachingEventTo(coaching);
		
		System.out.println(coachingList);
		
		List<Event> events = new ArrayList<Event>();
		
		for (ExRecord exRecord2 : list) {
			
			events.add(new Event(exRecord2.getName(),exRecord2.getStartTime(),exRecord2.getType()));
			
		}//for end
		
		for (Coaching coaching2 : coachingList) {
			
			events.add(new Event(coaching2.getNickname(),coaching2.getCoachingDate(),"C",coaching2.getOkToggle()));
		}//for end

		
		PrintWriter out=resp.getWriter();
		ObjectMapper om = new ObjectMapper();
		
				
		String json = om.writeValueAsString(events);
		System.out.println(json);
		
		out.print(json);
	
	}
}
