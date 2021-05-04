package com.joa.sht.gym_zip.servlet.ajax;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;

import com.joa.sht.gym_zip.util.ResizeImageUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.coremedia.iso.IsoFile;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/ajax/uploadVideo.json")
public class UploadVideoFile extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		float duration=0;
		
		resp.setContentType("application/json;charset=UTF-8");

		ServletContext application = req.getServletContext();
		
		String root = application.getRealPath("/img/");
		System.out.println("root: "+root);
		
		//upload 폴더 경로 (원본크기 이미지 파일경로)
		String uploadPath=root+"upload"+File.separator;
		
		MultipartRequest mr = new MultipartRequest(req, uploadPath, 1024*1024*100/*100메가*/, "UTF-8", new DefaultFileRenamePolicy());
		
		
		
		//파일이름
		String videoName= mr.getFilesystemName("inputVideoFile");

		System.out.println(uploadPath+videoName);
		
		
		//동영상 파일의 시간을 얻어내는 라이브러리 
		IsoFile isoFile = new IsoFile(uploadPath+videoName);
		
        long result =
                isoFile.getMovieBox().getMovieHeaderBox().getDuration() /
                isoFile.getMovieBox().getMovieHeaderBox().getTimescale();
        
        isoFile.close();
		
		System.out.println(result);
		
		//min = sec / 60; hour = min / 60; sec = sec % 60; min = min % 60;

		int min = (int)(result%3600/60);
		int hour = (int)(result/3600);
		int sec = (int)(result%3600/60);
		
		String m=null;
		String h = null;
		String s=null;
		
		String minStr= Integer.toString(min);
		if(minStr.length()==1) {m="0"+minStr;}
		String hourStr= Integer.toString(hour);
		if(hourStr.length()==1) {h="0"+hourStr;}
		String secStr= Integer.toString(sec);
		if(secStr.length()==1) {s="0"+secStr;}
		
		System.out.println(h+":"+m+":"+s);
		
		String videoDuration = h+":"+m+":"+s;
		
	
		PrintWriter out = resp.getWriter();
		
		out.print("{\"videoFileName\":\""+videoName+"\",\"videoDuration\":\""+videoDuration+"\"}");
		
		
	}
}
