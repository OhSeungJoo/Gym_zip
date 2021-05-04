package com.joa.sht.gym_zip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.Curriculum;
import com.joa.sht.gym_zip.vo.LectureAdImage;

public class LectureAdImageDAO {
	//0126 홍보사진 등록  백경현
	public static int insertLectureAdImage(LectureAdImage la) {
		
		SqlSession session =null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("lectureAdImage.insertLectureAdImage", la);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return 0;
	}
	
	// 0130 홍보 사진 검색 오승주 
		public static List<LectureAdImage> selectLectureAdImageList(int no) {
			
			SqlSession session =null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.selectList("lectureAdImage.selectLectureAdImageList",no);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return null;
		}

}
