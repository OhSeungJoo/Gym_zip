package com.joa.sht.gym_zip.dao;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.EnergyHistory;
import com.joa.sht.gym_zip.vo.LecturePayment;
import com.joa.sht.gym_zip.vo.Member;

public class EnergyHistoryDAO {

	// 멤버의 강의 신청시 에너지 히스토리 생성 메서드 
	public static int insertMemberLecturePayment(LecturePayment lecturePayment) {
		
		SqlSession session = null;
		
		try {
			session=SqlSessionUtil.getSession();
			return session.insert("energyHistory.insertMemberLecturePayment", lecturePayment);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return 0;
	}
	// end 멤버의 강의 신청시 에너지 히스토리 생성 메서드 
	
	// 수강생 강의 신청시 코치의 에너지 히스토리 생성 메서드 
		public static int insertCoachLecturePayment(LecturePayment lecturePayment) {
			
			SqlSession session = null;
			
			try {
				session=SqlSessionUtil.getSession();
				return session.insert("energyHistory.insertCoachLecturePayment", lecturePayment);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return 0;
		}
		// end 멤버의 강의 신청시 코치의 에너지 히스토리 생성 메서드 
		
		
		public static EnergyHistory getEnergyHistory(int memberNo) {
			
			SqlSession session = null;
			
			try {
				session= SqlSessionUtil.getSession();
				return session.selectOne("energyHistory.getEnergyHistory", memberNo);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return null;
		}
		
		// 구독시 히스토리 생성
		public static int insertSubscribe(EnergyHistory eh) {
			
			SqlSession session = null;
			
			try {
				session=SqlSessionUtil.getSession();
				return session.insert("energyHistory.insertSubscribe", eh);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return 0;
		}
}
