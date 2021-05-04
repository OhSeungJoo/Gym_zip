package com.joa.sht.gym_zip.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.joa.sht.gym_zip.dao.LectureDAO;
import com.joa.sht.gym_zip.vo.Lecture;
import com.joa.sht.gym_zip.vo.LectureListFilter;

@WebServlet("/ajax/getLectureCardCount.json")
public class GetLectureCardCount extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean[] leveltf= {false,false,false};
		boolean[] allLeveltf = {true,true,true};
		
		boolean[] gendertf= {false,false,false};
		boolean[] allGendertf= {true,true,true};
		
		String sort=req.getParameter("sort");
		String[] level=req.getParameterValues("level");
		String[] gender=req.getParameterValues("gender");
		
	
		// 시간 필터
		String timeRangeStartStr=req.getParameter("timeRangeStart");
		String timeRangeEndStr=req.getParameter("timeRangeEnd");
				
		int timeRangeStart=Integer.parseInt(timeRangeStartStr);
		int timeRangeEnd=Integer.parseInt(timeRangeEndStr);
				
				
				
				
		// 난이도 넘어온 값이 있을 때 
		if(level!=null) {
			for(String levels:level) {
				// 해당하는 값을 true로 변경
				//index=0부터이므로 1을 빼준다
				leveltf[Integer.parseInt(levels)-1]=true;
			}
		}
		else {
			// 난이도 넘어온 값이 없을 때
			// 아무 것도 선택하지 않았을경우 다 true로 한다. 
			leveltf=allLeveltf;
		}
		
		// 성별 넘어온 값이 있을 때 
		if(gender!=null) {
			for(String genders:gender) {
				gendertf[Integer.parseInt(genders)-1]=true;
			}
		}
		else {
			// 성별에 넘어온 값이 없으면 
			// 모두 참으로 해준다. 
			gendertf=allGendertf;
		}
		
		
		//강의 필터 객체 생성 
		LectureListFilter lectureListFilter=new LectureListFilter();
		
		// 정렬 기준 
		lectureListFilter.setSort(sort);
		
		// 난이도 
		lectureListFilter.setBigginer(leveltf[0]);
		lectureListFilter.setIntermediate(leveltf[1]);
		lectureListFilter.setAdvanced(leveltf[2]);
		
		// 성별 
		lectureListFilter.setMale(gendertf[0]);
		lectureListFilter.setFemale(gendertf[1]);
		lectureListFilter.setMiddle(gendertf[2]);
		
		// 시간 필터 시간 기준들
		lectureListFilter.setTimeRangeStart(timeRangeStart);
		lectureListFilter.setTimeRangeEnd(timeRangeEnd);
				
		
		
		
		resp.setContentType("application/json;charset=UTF-8");
		int lectureNum = LectureDAO.selectLectureCardCount(lectureListFilter);
		
		PrintWriter out = resp.getWriter();
		out.print("{\"lectureNum\":"+lectureNum+"}");
		
	}
}
