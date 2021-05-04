package com.joa.sht.gym_zip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.Lecture;
import com.joa.sht.gym_zip.vo.LectureReview;
import com.joa.sht.gym_zip.vo.LectureReviewContent;
import com.joa.sht.gym_zip.vo.PageVO;

public class LectureReviewDAO {

	// 강의 리뷰들 
		// 수강생의 이름, 티어, 리뷰 내용, 작성일, 프로필 사진 등을 나타내기 위해 사용 
		public static List<LectureReviewContent> selectLectureReviewList(PageVO pageVO) {
			
			SqlSession session =null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.selectList("lectureReview.selectLectureReviewList",pageVO);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return null;
		}
		// end 강의 리뷰들 
		
		// 강의 리뷰 평균 구하기 
	public static LectureReview selectLectureReviewAvg(int no) {
			
			SqlSession session =null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.selectOne("lectureReview.selectLectureReviewAvg",no);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return null;
		}
	//end 강의 리뷰 평균 구하기 

//리뷰 업데이트
// 0120 조용규
	public static int updateLectureReview(LectureReview lectureReview) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.update("lectureReview.updateLectureReview", lectureReview);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return 0;
	}
}
