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
import com.joa.sht.gym_zip.dao.RepresentExercisesDAO;
import com.joa.sht.gym_zip.vo.ReExerciseFilter;
import com.joa.sht.gym_zip.vo.RepresentExercise;



@WebServlet("/searchRepresentExerciseList.json")
public class RepresentExList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean[] part= {false,false,false,false,false,false,false};
		boolean[] allPart = {true,true,true,true,true,true,true};
		//1:하체,2;가슴,3:등,4:어께,5:팔,6:복근,7:전신
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		//page번호 받아오기
		String pageNoStr = req.getParameter("pageNo");
		int pageNo = Integer.parseInt(pageNoStr);
		//운동필터 객체 생성
		ReExerciseFilter ef = new ReExerciseFilter(pageNo,9);
		
		//정렬순 파라미터 받아와서 객체에 set
		String sort = req.getParameter("sort");
		ef.setSort(sort);
		//난이도 파라미터 받아와서 객체에 set
		String level= req.getParameter("level");
		ef.setLevel(level);
		//부위 배열 파라미터 받아온다.
		String parts[] = req.getParameterValues("part");
		//객체에 부위 정보 세팅
		if(parts!=null) {
			for (String partNo : parts) {
				//index=0부터이므로 1을 빼준다
				part[Integer.parseInt(partNo)-1]=true;
			}
		}else {
			//아무것도 오지않았을때는 전부 온 것으로 한다.
			part = allPart;
		}
		ef.setBottom(part[0]);
		ef.setChest(part[1]);
		ef.setBack(part[2]);
		ef.setSholder(part[3]);
		ef.setArms(part[4]);
		ef.setStomach(part[5]);
		ef.setBody(part[6]);
		List<RepresentExercise> list = RepresentExercisesDAO.selectFilter(ef);
		PrintWriter out = resp.getWriter();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		out.print(jsonStr);
	}
}
