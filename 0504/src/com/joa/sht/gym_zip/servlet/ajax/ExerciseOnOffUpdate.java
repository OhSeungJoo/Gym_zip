package com.joa.sht.gym_zip.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.joa.sht.gym_zip.dao.ExerciseDAO;
import com.joa.sht.gym_zip.vo.Exercise;

@WebServlet("/ajax/OnOffUpdate.json")
public class ExerciseOnOffUpdate extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
		//파라미터
		String exNoStr = req.getParameter("exNo");
		System.out.println("exNoStr: "+exNoStr);
		String onOff = req.getParameter("onOff");
		System.out.println("onOff: "+onOff);
		
		//형변환
		int no = Integer.parseInt(exNoStr);
		System.out.println("no: "+no);
		
		
		if(onOff.equals("T")) 
		{
			onOff="F";
		}else {
			onOff="T";
		}

		System.out.println(onOff);
		
		Exercise ex = new Exercise(no,onOff);
		int result = ExerciseDAO.updateOnOff(ex);
		
		
		ObjectMapper om = new ObjectMapper();
		
		String json = om.writeValueAsString(result);
		
		PrintWriter out = resp.getWriter();
		
		out.print(json);
		
		System.out.println(json);
		
	}//doPost() END
	
}//ExerciseOnOffUpdate END
