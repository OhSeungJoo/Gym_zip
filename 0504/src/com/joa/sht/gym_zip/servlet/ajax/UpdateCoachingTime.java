package com.joa.sht.gym_zip.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joa.sht.gym_zip.dao.CoachingDAO;
import com.joa.sht.gym_zip.vo.CAvailable;

@WebServlet("/ajax/updateCoachingTime.json")
public class UpdateCoachingTime extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] workingTimes = req.getParameterValues("workingTime");
		
		//코치번호 얻어와서 
		String noStr=req.getParameter("no");
		int no = Integer.parseInt(noStr);
		
		System.out.println("no:"+no);
		
		
		
		CAvailable  ca =new CAvailable();
		ca.setCoachNo(no);
		CoachingDAO.updateAvailableZero(no);
		
	
		
		for (String workingTime : workingTimes) {
			
			if(workingTime.equals("999")) {
				CoachingDAO.updateAvailableZero(no);
			}
			
			String dayStr=workingTime.substring(0, 1);
			String timeStr=workingTime.substring(1, 3);
			
			int times = Integer.parseInt(timeStr);
			int days = Integer.parseInt(dayStr);
			
			System.out.println(days);
			System.out.println(times);
			
		
			ca.setDays(days);
			ca.setTimes(times);
			
			CoachingDAO.updateAvailable(ca);
				
			}//for END
			
		}//doPost() END
		
	}
/*
for(int i=0;i<7;i++) {
	
	for(int j=0;j<24;j++) {
		
		/*if(workingTime.equals("999")) {
			ca.setCoachNo(no);
			ca.setDays(i);
			ca.setTimes(j);
			ca.setOnOff(0);
			//c_vailable테이블에 on_off 컬럼이 number형이여서 CAvailable Vo에 onOff 멤버필드 int형으로 바꿈
			//CoachingDAO.insertAvailable(ca);
			 
		}else {
			ca.setCoachNo(no);
			ca.setDays(i);
			ca.setTimes(j);
			ca.setOnOff(1);
			//CoachingDAO.insertAvailable(ca);
				
		}//if~else END
		
	}//times for() END
*/	