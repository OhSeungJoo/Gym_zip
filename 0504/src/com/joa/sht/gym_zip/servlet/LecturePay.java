package com.joa.sht.gym_zip.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joa.sht.gym_zip.dao.EnergyHistoryDAO;
import com.joa.sht.gym_zip.dao.LectureDAO;
import com.joa.sht.gym_zip.dao.LectureListStdDAO;
import com.joa.sht.gym_zip.dao.MemberDAO;
import com.joa.sht.gym_zip.vo.Lecture;
import com.joa.sht.gym_zip.vo.LecturePayment;

@WebServlet("/lecturePay.joa")
public class LecturePay extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String lectureNoStr=req.getParameter("leNo");
		String memberNoStr=req.getParameter("meNo");
		
		// 형변환 
		int lectureNo=Integer.parseInt(lectureNoStr);
		int memberNo=Integer.parseInt(memberNoStr);
		
		// 강의 번호를 이용하여 select 구문 수행시키기 
		// 코치 번호와, 강의 기간, 금액을 알기 위함 이다. 
		Lecture lecture=LectureDAO.selectLectureInform(lectureNo);
		
		int coachNo=lecture.getCoachNo();
		int period=lecture.getPeriod();
		int cost=lecture.getCost();
		
	
		// 강의 결제에 대한 객체 생성 
		LecturePayment lecturePayment =new LecturePayment
		(memberNo , coachNo, lectureNo, period,  cost) ;
		
	
		// 신청한 수강생 에너지 차감하기 (강의료, 수강생 번호 ) // 수강생 번호로 조회 가능 
		MemberDAO.updateMemberLecturePayment(lecturePayment);
		
		
		// 신청한 강의의 코치 에너지 추가하기 (코치 번호, 강의료 ) // 강의 번호로 조회 가능 
		MemberDAO.updateCoachLecturePayment(lecturePayment);
		
		
		// lecture_list_std에 목록 추가하기 강의 번호와 수강생 번호 이용하여 
		LectureListStdDAO.insertLectureListStd(lecturePayment);
		
		// 에너지 히스토리에도 추가 해야 함 수강생 코치 둘다  
		
		// lecture_list_std no 구하기 
		int lectureStdNo=LectureListStdDAO.selectLectureListStdNo(lecturePayment);
		
		System.out.println(lectureStdNo);
		
		lecturePayment.setLectureStdNo(lectureStdNo);
		// 이건 수강생 
		EnergyHistoryDAO.insertMemberLecturePayment(lecturePayment);
		// 이건 코치 
		EnergyHistoryDAO.insertCoachLecturePayment(lecturePayment);
		
		

		resp.sendRedirect("/training_room.jsp?no="+lecturePayment.getMemberNo());
		
	}
}
