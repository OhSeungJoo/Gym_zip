package com.joa.sht.gym_zip.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.ognl.ObjectMethodAccessor;
import org.apache.jasper.tagplugins.jstl.core.Out;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.joa.sht.gym_zip.dao.LectureDAO;
import com.joa.sht.gym_zip.dao.MemberDAO;
import com.joa.sht.gym_zip.vo.Lecture;
import com.joa.sht.gym_zip.vo.Member;

@WebServlet("/lectureList.json")
public class LectureList extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
		String memberNoStr = req.getParameter("memberNo");
		int memberNo = Integer.parseInt(memberNoStr);


		
		List<Lecture> list = LectureDAO.selectMemberLecture(memberNo);
		PrintWriter out=resp.getWriter();
		ObjectMapper om = new ObjectMapper();
		String jsonStr = om.writeValueAsString(list);
		out.print(jsonStr);
		
	}
	
	
}
