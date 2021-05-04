package com.joa.sht.gym_zip.servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joa.sht.gym_zip.dao.CurriculumDAO;
import com.joa.sht.gym_zip.dao.LectureAdImageDAO;
import com.joa.sht.gym_zip.dao.LectureDAO;
import com.joa.sht.gym_zip.vo.Curriculum;
import com.joa.sht.gym_zip.vo.Lecture;
import com.joa.sht.gym_zip.vo.LectureAdImage;
import com.joa.sht.gym_zip.vo.Member;

@WebServlet("/lectureRegister.jsp")
public class LectureRegister extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		try {
			Member m = (Member)session.getAttribute("loginMember");
			int coachNo = m.getNo();

			String name = req.getParameter("name");
			String dueStr = req.getParameter("due");
			int due = Integer.parseInt(dueStr);

			String gender = req.getParameter("gender");
			System.out.println(gender);
			String level = req.getParameter("level");
			String lectureInfoText = req.getParameter("lectureInfoText");
			String targetText = req.getParameter("targetText");
			String curriculum=req.getParameter("curriculumList");
			String timeStr=req.getParameter("time");
			int time = Integer.parseInt(timeStr);  
			String thumnailUrl = req.getParameter("thumbnailUrl");
			String advertiseImage = req.getParameter("advertiseImage");
		
			String energyPriceStr= req.getParameter("energyprice");
			int cost=Integer.parseInt(energyPriceStr);
			int pos = thumnailUrl.lastIndexOf(".");
			String ext = thumnailUrl.substring(pos);
			/*
			 * 해줘야 하는거
			 * 1. 강의 등록
			 * 2. 강의 사진 등록
			 * 3. 강의 커리큘럼 등록 
			 */
			Lecture l = new Lecture();
			l.setTitle(name);
			l.setLevels(level);
			l.setPeriod(due);
			l.setTargetGender(gender);
			l.setIntroduction(lectureInfoText);
			l.setRecommand(targetText);
			l.setTimes(time);
			l.setCost(cost);
			l.setCoachNo(coachNo);
			//확장자명
			l.setThumbnail(ext);
			//강의 추가함
			int result = LectureDAO.insertLecture(l);
			// 강의 추가하고 no조회
			List<Lecture> list  = LectureDAO.selectLectureNo(l);
			int no = list.get(0).getNo();
			// 썸네일 이미지 이름 바꿔준다. no+확장자로
			ServletContext application = req.getServletContext();
			String rootPath = application.getRealPath("/");
			System.out.println(rootPath);
			//3:2 비율 이미지 이름변경
			//기존경로
			String path = rootPath+"img"+File.separator+"thumbnail"+File.separator + thumnailUrl;
			//새경로
			String newPath = rootPath+"img"+File.separator+"thumbnail"+File.separator +Integer.toString(no)+ext;
			//저장하려고 하는 이름을 가진 파일이 있으면 삭제
			File f = new File(newPath);
			if(f.exists()) {
				f.delete();
			}
			File file = new File(path);
			file.renameTo(new File(newPath));
			//2:1 비율 이미지 이름 변경
			//기존경로
			path = rootPath+"img"+File.separator+"bigThumbnail"+File.separator + thumnailUrl;
			//새경로
			newPath = rootPath+"img"+File.separator+"bigThumbnail"+File.separator +Integer.toString(no)+ext;
			//저장하려고 하는 이름을 가진 파일이 있으면 삭제
			f = new File(newPath);
			if(f.exists()) {
				f.delete();
			}
			file = new File(path);
			file.renameTo(new File(newPath));
			
			
			Curriculum c = new Curriculum();
			// 커리큘럼 테이블에 순서대로 추가 한다. 
			String[] cur = curriculum.split(",");
			c.setLectureNo(no);
			for (int i = 0; i < cur.length; i++) {
				c.setExerciseNo(Integer.parseInt(cur[i]));
				c.setSeq(i+1);
				CurriculumDAO.insertCurriculum(c);
			}
			
			LectureAdImage la = new LectureAdImage();
			// 홍보 이미지 테이블에 추가 한다.
			String[] adi = advertiseImage.split(",");
			la.setLectureNo(no);
			for (int i = 0; i < adi.length; i++) {
				la.setUrl(adi[i]);
				LectureAdImageDAO.insertLectureAdImage(la);
			}
			resp.sendRedirect("/main.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			//session.setAttribute("errorMsgLG", "강의 생성에 실패 했습니다. 다시 시도해 주세요.");
			resp.sendRedirect("/lectureRigisterForm.jsp");
		}
	}

}
