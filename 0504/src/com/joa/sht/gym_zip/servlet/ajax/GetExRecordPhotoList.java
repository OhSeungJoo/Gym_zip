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
import com.joa.sht.gym_zip.dao.LectureDAO;
import com.joa.sht.gym_zip.dao.MemberDAO;
import com.joa.sht.gym_zip.vo.ExRecordPhoto;
import com.joa.sht.gym_zip.vo.Lecture;

@WebServlet("/ajax/ExRecordPhotos.json")
public class GetExRecordPhotoList extends HttpServlet{
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 값 받기 
		String pageNoStr=req.getParameter("pageNo");
		String numPageStr=req.getParameter("numPage");
		// 형 변환
		int pageNo=Integer.parseInt(pageNoStr);
		int numPage=Integer.parseInt(numPageStr);
		// 운동 기록 사진 어디까지 받을지 ?????? 
		int endNum=pageNo*numPage;
		
		
		
		List<ExRecordPhoto> photos=MemberDAO.selectExRecordPhotoList(endNum);
		
		
		resp.setContentType("application/json;charset=UTF-8");	
		PrintWriter out = resp.getWriter();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(photos);
		out.print(jsonStr);
		
		
	}
}
