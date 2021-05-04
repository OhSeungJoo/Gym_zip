package com.joa.sht.gym_zip.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.joa.sht.gym_zip.dao.CoachDAO;
import com.joa.sht.gym_zip.util.PaginateUtil;
import com.joa.sht.gym_zip.vo.Coach;
import com.joa.sht.gym_zip.vo.CoachListFilter;

@WebServlet("/ajax/getCoachList.json")

public class CoachList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
		String sort = req.getParameter("sort");
		String pageStr = req.getParameter("page");
		int pageNo = Integer.parseInt(pageStr);
		String[] days = req.getParameterValues("days");
		String[] timeArray = req.getParameterValues("times");
		
		
		System.out.println(sort);
		
		CoachListFilter cf = new CoachListFilter(pageNo,9);

		
		//정렬 라디오 박스 값 받아와서 세팅
		cf.setSort(sort);
		
		//시간 map에 담아서 시작 시간, 끝시간 세팅
		if(timeArray!=null) {
		List<Map<String, Integer>> times = new ArrayList<Map<String,Integer>>();
				
		
		for (String timeStr : timeArray) {
			
			Map<String, Integer> time = new ConcurrentHashMap<String, Integer>();
			
			int tmp = Integer.parseInt(timeStr);
			
			System.out.println("tmp:"+tmp);
			
			switch (tmp) {
			case 1: time.put("start", 3);
					time.put("end", 5);
			break;
			case 2: time.put("start", 6);
					time.put("end", 12);
			break;
			case 3: time.put("start", 13);
					time.put("end", 18);
			break;
			case 4: time.put("start", 19);
					time.put("end", 22);
			break;
			case 5: time.put("start", 23);
					time.put("end", 2);
			break;
			}//switch end
			
			times.add(time);
			
		}//for end
	
		System.out.println("times:"+times);
		
		cf.setTimes(times);
		}
		
		if(days!=null) {
	
			cf.setDays(days);
		
		}
		
		System.out.println(cf.getDays());
		
		List<Coach> coachs = CoachDAO.selectList(cf);
		
		int total = CoachDAO.selectCoachTotal(cf);
		int numBlock=5;
		
		String paginate = PaginateUtil.getPaginate(pageNo, total, 9, numBlock, "/coachList.jsp", "page=");
		
		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();
		modelMap.put("coachList", coachs);
		modelMap.put("paginate", paginate);
		modelMap.put("total", total);
		
		ObjectMapper om = new ObjectMapper();
		
		String json = om.writeValueAsString(modelMap);
		
		PrintWriter out = resp.getWriter();
		
		out.print(json);
		
		System.out.println(json);
		
	}//doGet() END
		
	
}//CoachList END
