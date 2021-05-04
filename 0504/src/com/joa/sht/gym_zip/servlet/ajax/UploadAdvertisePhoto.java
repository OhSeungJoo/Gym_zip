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
@WebServlet("/uploadAdvertisePhoto.json")
public class UploadAdvertisePhoto extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//ServletContext
		ServletContext application = req.getServletContext();
		//파일 업로드의 경로
		String rootPath = application.getRealPath("/");
		System.out.println(rootPath);
		String uploadPath = rootPath+"img"+File.separator+"tmpAdvertise"+File.separator;
		MultipartRequest mr = new MultipartRequest(req,uploadPath,1024*1024*100,"UTF-8",new DefaultFileRenamePolicy());
		resp.setContentType("application/json; charset=UTF-8");
		String fileName = mr.getFilesystemName("uploadImg");
		String renewalPath = rootPath+"img"+File.separator+"advertise"+File.separator;
		ResizeImageUtil.resize(uploadPath+fileName, renewalPath+fileName, 280);
		
		System.out.println(fileName);
		PrintWriter out = resp.getWriter();
		System.out.println(fileName);
		out.print("{\"url\":\""+fileName+"\"}");
	}
}
