package com.joa.sht.gym_zip.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joa.sht.gym_zip.dao.CoachDAO;
import com.joa.sht.gym_zip.dao.CoachingDAO;
import com.joa.sht.gym_zip.dao.MemberDAO;
import com.joa.sht.gym_zip.vo.CAvailable;
import com.joa.sht.gym_zip.vo.Member;

@WebServlet("/join.do")
public class Join extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 파라미터 값들 받아오기 
		
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		String confirmPassword=req.getParameter("confirmPassword");
		String nickname=req.getParameter("nickName");
		String birthYear=req.getParameter("birthYear");
		String birthMonth=req.getParameter("birthMonth");
		String birthDay=req.getParameter("birthDay");
		String heightStr=req.getParameter("height");
		String weightStr=req.getParameter("weight");
		String gender=req.getParameter("gender");
		
	
		// 적절하게 형변환
		Date birthDate=Date.valueOf(birthYear+"-"+birthMonth+"-"+birthDay);
		Double height=Double.parseDouble(heightStr);
		Double weight=Double.parseDouble(weightStr);
		
		
		Member member=new Member(nickname,email,password,gender, height,weight,birthDate);
		
		
		MemberDAO.joinMember(member);
		
		// 코치에도 추가 해줘야함 
		// 이메일과 비밀번호를 이용하여 멤버 번호 얻어오기 
		int coachNo=MemberDAO.selectMemberNo(member);
		
		// 코치 테이블에 인서트
		CoachDAO.insertJoinCoach(coachNo);
		
		
		//0209 박해원 
		//member join 할 때 C_available 테이블에 insert 
		CAvailable ca = new CAvailable();
		
		for(int i=0;i<7;i++) {
			for(int j=0;j<24;j++) {
				ca.setDays(i);
				ca.setTimes(j);
				ca.setCoachNo(coachNo);
				
				CoachingDAO.insertAvailable(ca);
				
			}
		}
		
		
		resp.sendRedirect("/login.jsp");
		
	}
}
