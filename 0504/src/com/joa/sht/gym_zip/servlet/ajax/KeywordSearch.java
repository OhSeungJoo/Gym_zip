package com.joa.sht.gym_zip.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.joa.sht.gym_zip.dao.LectureDAO;
import com.joa.sht.gym_zip.vo.CoachSearch;
import com.joa.sht.gym_zip.vo.Exercise;
import com.joa.sht.gym_zip.vo.Keyword;
import com.joa.sht.gym_zip.vo.Lecture;
@WebServlet("/keywordSearch.json")
public class KeywordSearch extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		try {
			String[] keywords = req.getParameterValues("keywordArray[]");
			if(keywords==null) {
				keywords = req.getParameterValues("keywordArray");
			}
			System.out.println("키워드 개수"+keywords.length);
			if(keywords.length>0) {
				for (int i = 0; i < keywords.length; i++) {
					if(keywords[i] != "") {
						keywords[i]=("%"+keywords[i]+"%");
					}
				}
			}
			Keyword k= new Keyword(keywords);
			//System.out.println("파라미터");
			List<Exercise> elist = ExerciseDAO.selectbyKeyword(k);
			//System.out.println("운동");
			List<Lecture> llist =LectureDAO.selectbyKeyword(k);
			//System.out.println("강의");
			List<CoachSearch> clist = CoachDAO.selectbyKeyword(k);
			//System.out.println("코치");
			Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();
			
			modelMap.put("exercise",elist);
			modelMap.put("lecture",llist);
			modelMap.put("coach",clist);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(modelMap);
			System.out.println(json);
			out.print(json);
		}catch (NullPointerException e) {
			e.printStackTrace();
			out.print("{ \"exercise\": [], \"lecture\": [], \"coach\": [] }");
		}
	
	}
}
