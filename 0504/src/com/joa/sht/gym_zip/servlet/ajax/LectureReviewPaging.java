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
import com.joa.sht.gym_zip.dao.LectureReviewDAO;
import com.joa.sht.gym_zip.dao.RepresentExercisesDAO;
import com.joa.sht.gym_zip.vo.LectureReviewContent;
import com.joa.sht.gym_zip.vo.PageVO;
import com.joa.sht.gym_zip.vo.RepresentExercise;

@WebServlet("/ajax/lectureReviewPage.json")
public class LectureReviewPaging extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		
		
		String noStr=req.getParameter("no");
		String pageNoStr=req.getParameter("pageNo");
		String numPageStr=req.getParameter("numPage");

		// 해당 페이지에 속하는 리뷰들
		
		// 형변환
		int no=Integer.parseInt(noStr);
		int pageNo=Integer.parseInt(pageNoStr);
		int numPage=Integer.parseInt(numPageStr);
		
		
		
		List<LectureReviewContent> lectureReviews=LectureReviewDAO.selectLectureReviewList(new PageVO(pageNo,numPage,no));
		
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out=resp.getWriter();
	
		
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(lectureReviews);
		out.print(jsonStr);
		
		
	}
}
