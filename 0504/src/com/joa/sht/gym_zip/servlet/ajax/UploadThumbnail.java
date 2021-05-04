package com.joa.sht.gym_zip.servlet.ajax;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joa.sht.gym_zip.util.ResizeImageUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@WebServlet("/uploadThumbnail.json")
public class UploadThumbnail extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//ServletContext
		ServletContext application = req.getServletContext();
		//파일 업로드의 경로
		String rootPath = application.getRealPath("/");
		
		String uploadPath = rootPath+"img"+File.separator+"tmpThumbnail"+File.separator;
		MultipartRequest mr = new MultipartRequest(req,uploadPath,1024*1024*100,"UTF-8",new DefaultFileRenamePolicy());
		
		resp.setContentType("application/json; charset=UTF-8");
		String renewalPath = rootPath+"img"+File.separator+"thumbnail"+File.separator;
		String rerenewalPath = rootPath+"img"+File.separator+"bigThumbnail"+File.separator;
		String fileName = mr.getFilesystemName("uploadImg");
		try {
			ResizeImageUtil.resize(uploadPath+fileName, renewalPath+fileName, 1200,800);
			ResizeImageUtil.resize(uploadPath+fileName, rerenewalPath+fileName, 1200,600);
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		PrintWriter out = resp.getWriter();
		System.out.println(fileName);
		out.print("{\"url\":\""+fileName+"\"}");
	}
}
