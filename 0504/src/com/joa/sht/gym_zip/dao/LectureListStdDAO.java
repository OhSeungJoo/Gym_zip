package com.joa.sht.gym_zip.dao;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.LectureListStd;
import com.joa.sht.gym_zip.vo.LecturePayment;

public class LectureListStdDAO {

	
	public static int updateLectureStartDate(LectureListStd lls) {
		SqlSession session=null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.update("lectureListStd.updateLecutreStartDate", lls);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return 0;
	}
	
	public static LectureListStd selectList(LectureListStd lls) {
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("lectureListStd.selectList", lls);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return null;
	}
	//0122 수강생 강의 결제시 lecture_list_std 레코드 추가 
			public static int insertLectureListStd(LecturePayment lecturePayment) {
				
				SqlSession session =null;
				
				try {
					session = SqlSessionUtil.getSession();
					return session.insert("lectureListStd.insertLectureList",lecturePayment);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					session.close();
				}
				
				return 0;
			}	
		// end 0122 수강생 강의 결제시 lecture_list_std 레코드 추가
			
		//0122 수강생 강의 결제시 lecture_list_std 번호 구하기  
			public static int selectLectureListStdNo(LecturePayment lecturePayment) {
				
				SqlSession session =null;
				
				try {
					session = SqlSessionUtil.getSession();
					return session.selectOne("lectureListStd.selectLectureListStdNo",lecturePayment);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					session.close();
				}
				
				return 0;
			}		
		// end 수강생 강의 결제시 lecture_list_std 번호 구하기  
			
			
		// 0122 이미 수강한 강의 인지 확인 
			public static int selectTakeLecture(LectureListStd lectureListStd) {
			
				SqlSession session =null;
				
				try {
					session = SqlSessionUtil.getSession();
					return session.selectOne("lectureListStd.selectTakeLecture",lectureListStd);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					session.close();
				}
				
				return 0;
			}		
		// end 0122 이미 수강한 강의 인지 확인 
}
