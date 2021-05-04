package com.joa.sht.gym_zip.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.joa.sht.gym_zip.dao.EnergyHistoryDAO;
import com.joa.sht.gym_zip.vo.EnergyHistory;


@WebServlet("/getEnergyHistory.json")
public class GetEnergyHistory extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memberNoStr = req.getParameter("memberNo");
		int memberNo = Integer.parseInt(memberNoStr);
		
		
		EnergyHistory energyHistory = EnergyHistoryDAO.getEnergyHistory(memberNo);
		
		System.out.println(energyHistory.getEnergy());
		
		PrintWriter out = resp.getWriter();
		ObjectMapper om = new ObjectMapper();
		String jsonStr = om.writeValueAsString(energyHistory);
		out.print(jsonStr);
	}
}
