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
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.joa.sht.gym_zip.dao.ExerciseDAO;
import com.joa.sht.gym_zip.dao.LectureDAO;
import com.joa.sht.gym_zip.dao.RepresentExercisesDAO;
import com.joa.sht.gym_zip.dao.SubscribeDAO;
import com.joa.sht.gym_zip.vo.Count;
import com.joa.sht.gym_zip.vo.Exercise;
import com.joa.sht.gym_zip.vo.Lecture;
import com.joa.sht.gym_zip.vo.Member;
import com.joa.sht.gym_zip.vo.ReExerciseFilter;
import com.joa.sht.gym_zip.vo.RepresentExercise;
import com.joa.sht.gym_zip.vo.Step;
import com.joa.sht.gym_zip.vo.Subscribe;



@WebServlet("/exerciseDetail.json")
public class ExerciseDetail extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		int memberNo;
		try {
			Member m = (Member)session.getAttribute("loginMember");
			memberNo = m.getNo();
		}catch (Exception e) {
			memberNo = -1;
		}
		System.out.println(memberNo);
		//json 뷰로 선택
		resp.setContentType("application/json;charset=UTF-8");
		
		//운동 번호 받기
		String noStr = req.getParameter("no");
		int no = Integer.parseInt(noStr);
		
		//운동 정보 가져오기
		Exercise e = ExerciseDAO.selectExerciseDetail(no);
		int coachNo=e.getCoachNo();
		
		//운동이 들어있는 강의들 목록 가져온다.
		List<Lecture> lectureList = LectureDAO.selectExerciseDetailLectureList(no);
		
		Count count = SubscribeDAO.selectSubscribeCount(no);
		System.out.println(count);
		
		//코치와 구독관계인지 확인 해봅니다
		Subscribe s = new Subscribe();
		s.setCoachNo(coachNo);
		s.setMemberNo(memberNo);
		Count check = SubscribeDAO.selectSubscribeCheck(s);
		
		//객체를 map에 넣는다.
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		map.put("exerciseDetail",e);
		map.put("lectureList", lectureList);
		map.put("subcribe",count);
		map.put("check", check);
		//map 객체를 String으로 변환해서 출력
		PrintWriter out = resp.getWriter();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(map);
		out.print(jsonStr);
	}
}
