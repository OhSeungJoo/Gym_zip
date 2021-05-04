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
import com.joa.sht.gym_zip.dao.ExerciseDAO;
import com.joa.sht.gym_zip.util.PaginateUtil;
import com.joa.sht.gym_zip.vo.Coach;
import com.joa.sht.gym_zip.vo.CoachExerciseListFilter;
import com.joa.sht.gym_zip.vo.CoachListFilter;
import com.joa.sht.gym_zip.vo.Exercise;

@WebServlet("/ajax/getExerciseList.json")

public class CoachExerciseList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
		//파라미터
		String sort = req.getParameter("sort");
		String pageStr = req.getParameter("page");
		String coachNoStr = req.getParameter("coachNo");
		
		
		
		//형변환
		int pageNo = Integer.parseInt(pageStr);
		int coachNo = Integer.parseInt(coachNoStr);
		
		System.out.println("sort: "+sort);
		System.out.println("pageNo: "+pageNo);
		System.out.println("coachNo:"+coachNo);
		
		CoachExerciseListFilter cel = new CoachExerciseListFilter(pageNo,5);
		
		cel.setCoachNo(coachNo);
		cel.setSort(sort);
		
		
		List<Exercise> exercises = ExerciseDAO.selectCoachExList(cel);
		
		int total = ExerciseDAO.selectCoachExListCount(cel.getCoachNo());
		int numBlock=5;
		
		String paginate = PaginateUtil.getPaginate(pageNo, total, 5, numBlock, "/coachExerciseList.jsp", "page=");
		
		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();
		modelMap.put("exerciseList", exercises);
		modelMap.put("paginate", paginate);
		modelMap.put("total", total);
		
		ObjectMapper om = new ObjectMapper();
		
		String json = om.writeValueAsString(modelMap);
		
		PrintWriter out = resp.getWriter();
		
		out.print(json);
		
		System.out.println(json);
	
		
	}//doGet() END
		
	
}//CoachList END
