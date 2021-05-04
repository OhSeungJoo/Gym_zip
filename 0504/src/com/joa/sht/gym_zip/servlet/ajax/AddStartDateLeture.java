package com.joa.sht.gym_zip.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.joa.sht.gym_zip.dao.LectureDAO;
import com.joa.sht.gym_zip.dao.LectureListStdDAO;
import com.joa.sht.gym_zip.vo.Lecture;
import com.joa.sht.gym_zip.vo.LectureListStd;

@WebServlet("/addStartDateLecture.json")
public class AddStartDateLeture extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
		String memberNoStr = req.getParameter("memberNo");
		int memberNo = Integer.parseInt(memberNoStr);

		String startDateStr = req.getParameter("startDate");
		Date startDate = Date.valueOf(startDateStr);
		
		String noStr = req.getParameter("no");
		int no = Integer.parseInt(noStr);
		
		System.out.println(memberNo);
		System.out.println(startDate);
		System.out.println(no);
		
		LectureListStd lls = new LectureListStd(memberNo, no, startDate);
		
		System.out.println(lls.getMemberNo());
		System.out.println(lls.getNo());
		System.out.println(lls.getStartDate());
		
  		LectureListStdDAO.updateLectureStartDate(lls);

  		LectureListStd list = LectureListStdDAO.selectList(lls);
  				
  		System.out.println(list);
  		
		PrintWriter out=resp.getWriter();
		ObjectMapper om = new ObjectMapper();
		String jsonStr = om.writeValueAsString(list);
		out.print(jsonStr);

	
	}
}
