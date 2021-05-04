package com.joa.sht.gym_zip.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joa.sht.gym_zip.dao.ExDummyDAO;
import com.joa.sht.gym_zip.dao.ExerciseDAO;
import com.joa.sht.gym_zip.dao.RepresentExercisesDAO;
import com.joa.sht.gym_zip.vo.ExDummy;
import com.joa.sht.gym_zip.vo.Exercise;
import com.joa.sht.gym_zip.vo.RepresentExercise;

@WebServlet("/registerEx.do")
public class ExRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		//represent_exercise 테이블에 insert 해야함
		String partStr= req.getParameter("part");
		String representEx= req.getParameter("representEx");
	
		//형변환
		int partNo = Integer.parseInt(partStr);
		

		//exercise 테이블에 insert 해야함
		String motionName= req.getParameter("motionName");
		String countExStr= req.getParameter("countEx");
		String countSetStr= req.getParameter("countSet");
		String exWeightStr = req.getParameter("countExWeight");
		String inputLevel= req.getParameter("inputLevel");
		String bmCheck= req.getParameter("bmCheck");
		String payCheck= req.getParameter("payCheck");
		String targetGender= req.getParameter("targetRadio");
		String memberNoStr = req.getParameter("memberNo");
		String thumbnail = req.getParameter("thumbnail");
		String url = req.getParameter("url");
		String exerciseTime = req.getParameter("time");
		
		System.out.println("bmCheck:"+bmCheck);
		//형변환
		int countExNum = Integer.parseInt(countExStr);
		int countSetNum = Integer.parseInt(countSetStr);
		int exWeight = Integer.parseInt(exWeightStr);
		int memberNo = Integer.parseInt(memberNoStr);
		
		if(inputLevel.equals("1")) {
			inputLevel="초급";
		}else if(inputLevel.equals("2")) {
			inputLevel="중급";
		}else {
			inputLevel="고급";
		}
		
		System.out.println("여기까진가;;");
		if( bmCheck==null || bmCheck.equals("")) {
			bmCheck="F";
			System.out.println("bmCheck: null이면? "+bmCheck);
			System.out.println("아니면 여기까진가;;");
		}
		
		
		//ex_dummy 테이블에 insert 해야함
		String fHeightStr= req.getParameter("fHeight");
		String fWeightStr= req.getParameter("fWeight");
		String fKcalStr= req.getParameter("fKcal");
		
		String mHeightStr= req.getParameter("mHeight");
		String mWeightStr= req.getParameter("mWeight");
		String mKcalStr= req.getParameter("mKcal");
		
		//형변환
		int femaleHeight = Integer.parseInt(fHeightStr);
		int femaleWeight = Integer.parseInt(fWeightStr);
		int femaleKcal =Integer.parseInt(fKcalStr);
		
		int maleHeight = Integer.parseInt(mHeightStr);
		int maleWeight = Integer.parseInt(mWeightStr);
		int maleKcal =Integer.parseInt(mKcalStr);
		
		/*=====================↑여기까지 파라미터's============================*/
		
		
		//대표운동 객체
		RepresentExercise reEx = new RepresentExercise();
		reEx.setPartNo(partNo);
		reEx.setTitle(representEx);
		reEx.setKcal((femaleKcal+maleKcal)/2);
		
		//운동 객체
		Exercise ex = new Exercise();
		
		ex.setName(motionName);
		ex.setExCount(countExNum);
		ex.setSetNum(countSetNum);
		ex.setExWeight(exWeight);
		ex.setLevels(inputLevel);
		ex.setBmOnOff(bmCheck);
		ex.setFree(payCheck);
		ex.setTargetGender(targetGender);
		ex.setCoachNo(memberNo);
		ex.setThumbnail(thumbnail);
		ex.setUrl(url);
		ex.setExerciseTime(exerciseTime);
		
		
		
		//남성 운동더미 객체
		ExDummy edMale = new ExDummy();
		edMale.setGender("M");
		edMale.setHeight(maleHeight);
		edMale.setWeight(maleWeight);
		edMale.setKcal(maleKcal);
		
		//여성 운동더미 객체
		ExDummy edFemale = new ExDummy();
		edFemale.setGender("F");
		edFemale.setHeight(femaleHeight);
		edFemale.setWeight(femaleWeight);
		edFemale.setKcal(femaleKcal);
		
		// 대표운동명과 부위번호 파라미터로  대표운동 테이블에서   select
		List<RepresentExercise> duplicates = RepresentExercisesDAO.selectDuplicateCheck(reEx);
		
		
		if(duplicates.isEmpty()) {
		
			//중복되는 값이 없으면 대표운동 등록(insert)
			RepresentExercisesDAO.insertReEx(reEx);
			
			int reExerciseNo = duplicates.get(0).getNo();
			
			ex.setExerciseNo(reExerciseNo);
			
			ExerciseDAO.insertEx(ex);
			
			List<Exercise> exList = ExerciseDAO.selectExNoList(ex);
			int exerciseNo= exList.get(0).getNo();

			edMale.setExNo(exerciseNo);
			edFemale.setExNo(exerciseNo);
			
			ExDummyDAO.insertEd(edMale);
			ExDummyDAO.insertEd(edFemale);
			
		
		
		}else {
			
			int reExerciseNo = duplicates.get(0).getNo();
			
			System.out.println("reExerciseNo:"+reExerciseNo);
			
			ex.setExerciseNo(reExerciseNo);
			
			ExerciseDAO.insertEx(ex);
			
			List<Exercise> exList = ExerciseDAO.selectExNoList(ex);
			int exerciseNo= exList.get(0).getNo();
			
			System.out.println("exerciseNo:"+exerciseNo);

			edMale.setExNo(exerciseNo);
			edFemale.setExNo(exerciseNo);
			
			ExDummyDAO.insertEd(edMale);
			ExDummyDAO.insertEd(edFemale);
			
			
		}
		
		resp.sendRedirect("/coach_mypage.jsp?no="+memberNo);
		
		
	}//doPost() END
	
}//ExRegister END
