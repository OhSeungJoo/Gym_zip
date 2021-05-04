package com.joa.sht.gym_zip.servlet.ajax;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joa.sht.gym_zip.dao.EnergyHistoryDAO;
import com.joa.sht.gym_zip.dao.ExerMemberDAO;
import com.joa.sht.gym_zip.dao.ExerciseDAO;
import com.joa.sht.gym_zip.dao.MemberDAO;
import com.joa.sht.gym_zip.dao.SubscribeDAO;
import com.joa.sht.gym_zip.util.ResizeImageUtil;
import com.joa.sht.gym_zip.vo.EnergyHistory;
import com.joa.sht.gym_zip.vo.ExerMember;
import com.joa.sht.gym_zip.vo.Exercise;
import com.joa.sht.gym_zip.vo.Subscribe;
import com.joa.sht.gym_zip.vo.WhoseExercise;
@WebServlet("/doSubscribe.json")
public class DoSubscribe extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			try {
				String mnoStr=req.getParameter("mno");
				System.out.println(mnoStr);
				String cnoStr=req.getParameter("cno");
				System.out.println(cnoStr);
				int mno=Integer.parseInt(mnoStr);
				int cno=Integer.parseInt(cnoStr);
				// 구독 추가
				Subscribe s = new Subscribe();
				s.setMemberNo(mno);
				s.setCoachNo(cno);
				int result = SubscribeDAO.insertSubscribe(s);
				System.out.println("구독 등록완료");
				//멤버 에너지 변경
				MemberDAO.updateEnergySub(mno);
				System.out.println("멤버 에너지 변경완료");
				//코치 에너지 변경
				MemberDAO.updateEnergyAdd(cno);
				System.out.println("코치 에너지 변경 완료");
				//에너지 히스토리 작성
				s.setMemberNo(mno);
				s.setCoachNo(cno);
				System.out.println(s.getMemberNo());
				System.out.println(s.getCoachNo());
				Subscribe ns = SubscribeDAO.selectSubscribeNo(s);
				int sno=ns.getNo();
				System.out.println(sno);
				EnergyHistory eh = new EnergyHistory();
				eh.setType("s");
				eh.setTypeNo(sno);
				//코치
				eh.setMemenrNo(cno);
				eh.setEnergy(49);
				EnergyHistoryDAO.insertSubscribe(eh);
				System.out.println("코치 에너지 히스토리 등록완료");
				//멤버
				eh.setMemenrNo(mno);
				eh.setEnergy(-49);
				EnergyHistoryDAO.insertSubscribe(eh);
				System.out.println("멤버 에너지 히스토리 등록완료");
				//운동 이 코치 꺼 다 추가?
				ExerMember em = new ExerMember();
				em.setMemberNo(mno);
				// 해당하는 코치의 모든 부위 운동리스트 가져온다.
				WhoseExercise we= new WhoseExercise();
				we.setExercisePart(0);
				we.setCoachNo(cno);
				List<Exercise> list = ExerciseDAO.selectExerciseByCoachAndPart(we);
				for (Exercise e : list) {
					int eno=e.getNo();
					System.out.println(eno);
					em.setExerciseNo(eno);
					ExerMemberDAO.insertExerMember(em);
					System.out.println("맴버 운동 테이블 등록");
				}
				System.out.println("맴버 운동 테이블 등록완료");
				out.print("{\"result\": 1 }");
			}
			catch(Exception e) {
				out.print("{\"result\": 0 }");
			}
			
		
	}
}
