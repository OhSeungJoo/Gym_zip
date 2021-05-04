package com.joa.sht.gym_zip.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joa.sht.gym_zip.dao.LectureReviewDAO;
import com.joa.sht.gym_zip.vo.LectureReview;

@WebServlet("/LectureReviewUpdate.joa")
public class LectureReviewUpdate extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String contents = "잘 들었습니다.";
		String delivery = "0";
		String prepare = "0";
		String kindness = "0";
		String quality = "0";
		String effect = "0";
		if(req.getParameter("reviewText")!=null) {
			contents = req.getParameter("reviewText");
		};
		
		if(req.getParameter("reviewCheck_1")!=null) {
			quality = req.getParameter("reviewCheck_1");
		};
		
		if(req.getParameter("reviewCheck_2")!=null) {
			delivery = req.getParameter("reviewCheck_2");
		};
		
		if(req.getParameter("reviewCheck_3")!=null) {
			effect = req.getParameter("reviewCheck_3");
		};
		
		if(req.getParameter("reviewCheck_4")!=null) {
			prepare = req.getParameter("reviewCheck_4");
		};
		if(req.getParameter("reviewCheck_5")!=null) {
			kindness = req.getParameter("reviewCheck_5");
		};
						
//		String effect = req.getParameter("reviewCheck_3");
//		String delivery = req.getParameter("reviewCheck_2");
//		String prepare = req.getParameter("reviewCheck_4");
//		String kindness = req.getParameter("reviewCheck_5");
//		String quality = req.getParameter("reviewCheck_1");

		String noStr = req.getParameter("no");
		System.out.println(noStr);
		int no = Integer.parseInt(noStr);

		LectureReview lectureReview = new LectureReview(no, contents, effect, delivery, prepare, kindness, quality);
		
		int result = LectureReviewDAO.updateLectureReview(lectureReview);
		//resp.sendRedirect("/lecutre_detail.jsp?no=");
		
		
	}
}
