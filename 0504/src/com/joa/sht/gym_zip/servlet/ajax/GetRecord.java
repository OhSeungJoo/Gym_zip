package com.joa.sht.gym_zip.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.joa.sht.gym_zip.dao.ExRecordDAO;
import com.joa.sht.gym_zip.vo.ExRecord;

@WebServlet("/getRecord.json")
public class GetRecord extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String memberNoStr = req.getParameter("memberNo");
		String startTimeStr = req.getParameter("startTime");
		
		int memberNo = Integer.parseInt(memberNoStr);
		Timestamp startTime = Timestamp.valueOf(startTimeStr);
		
		System.out.println(memberNo);
		System.out.println(startTime);

		//선택한 날짜의 데이터값 넣기
		ExRecord exRecord = new ExRecord(memberNo, startTime);
		
		ExRecord nowRecord = ExRecordDAO.getClickRecord(exRecord);
		//선택한 날짜의 이전의 날짜 값저장
		Timestamp prevStartTime = nowRecord.getNoPrev();
		
		//선택한 날짜 이전의 데이터값 넣기
		ExRecord exRecord2 = new ExRecord(memberNo,prevStartTime);
		
		ExRecord prevRecord = ExRecordDAO.getClickRecord(exRecord2);
		
		
		
		PrintWriter out=resp.getWriter();
		ObjectMapper om = new ObjectMapper();
		
		Map<String, Object> resultJson = new ConcurrentHashMap();

		
		resultJson.put("prevRecord", prevRecord);
		resultJson.put("nowRecord", nowRecord);

		String json = om.writeValueAsString(resultJson);
		
		System.out.println(json);
		
		out.print(json);
		
	}
}
