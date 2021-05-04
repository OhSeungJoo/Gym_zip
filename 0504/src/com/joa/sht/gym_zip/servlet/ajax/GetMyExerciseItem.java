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
import com.joa.sht.gym_zip.dao.ExerciseDAO;
import com.joa.sht.gym_zip.dao.LectureDAO;
import com.joa.sht.gym_zip.dao.RepresentExercisesDAO;
import com.joa.sht.gym_zip.dao.SubscribeDAO;
import com.joa.sht.gym_zip.vo.Count;
import com.joa.sht.gym_zip.vo.Exercise;
import com.joa.sht.gym_zip.vo.Lecture;
import com.joa.sht.gym_zip.vo.ReExerciseFilter;
import com.joa.sht.gym_zip.vo.RepresentExercise;
import com.joa.sht.gym_zip.vo.Step;
import com.joa.sht.gym_zip.vo.WhoseExercise;



@WebServlet("/getMyExerciseItem.json")
public class GetMyExerciseItem extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//json 뷰로 선택
		resp.setContentType("application/json;charset=UTF-8");
	
		//코치 번호 받기
		String coachNoStr = req.getParameter("coachNo");
		int coachNo = Integer.parseInt(coachNoStr);
		System.out.println(coachNo);
		//파트 번호 받기
		String exercisePartStr = req.getParameter("exersizePart");
		int exercisePart = Integer.parseInt(exercisePartStr);
		System.out.println(exercisePart);
		WhoseExercise we = new WhoseExercise(coachNo, exercisePart);
		
		List<Exercise> list = ExerciseDAO.selectExerciseByCoachAndPart(we);
		//map 객체를 String으로 변환해서 출력
		PrintWriter out = resp.getWriter();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		System.out.println(jsonStr);
		out.print(jsonStr);
	}
}
