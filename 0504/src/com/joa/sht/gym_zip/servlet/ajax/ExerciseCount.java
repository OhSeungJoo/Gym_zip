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
import com.joa.sht.gym_zip.dao.ExerciseDAO;
import com.joa.sht.gym_zip.vo.Count;
import com.joa.sht.gym_zip.vo.Exercise;
import com.joa.sht.gym_zip.vo.Step;
@WebServlet("/getExerciseCardListCount.json")
public class ExerciseCount extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
	
		//대표운동 번호 받기
		String reExStr = req.getParameter("reEx");
		int reEx = Integer.parseInt(reExStr);

		Count count = ExerciseDAO.selectExerciseCardCount(reEx);
		PrintWriter out = resp.getWriter();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(count);
		out.print(jsonStr);
	}
}
