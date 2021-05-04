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

@WebServlet("/ajax/uploadImage.json")
public class UploadImgFile extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("application/json;charset=UTF-8");

		ServletContext application = req.getServletContext();
		
		String root = application.getRealPath("/img/");
		System.out.println("root: "+root);
		
		//upload 폴더 경로 (원본크기 이미지 파일경로)
		String uploadPath=root+"upload"+File.separator;
		
		//profile 폴더 경로(리사이징된 이미지파일 경로)
		String exercisePath=root+"exercise"+File.separator;
		
		MultipartRequest mr = new MultipartRequest(req, uploadPath, 1024*1024*100/*100메가*/, "UTF-8", new DefaultFileRenamePolicy());
		
		//파일이름
		String imageName= mr.getFilesystemName("inputImgFile");

		
		//profile 폴더에 리사이즈해서 저장
		ResizeImageUtil.resize(uploadPath+imageName,exercisePath+imageName,300,200);
		
		
		PrintWriter out = resp.getWriter();
		
		out.print("{\"imgFileName\":\""+imageName+"\"}");
	}
}
