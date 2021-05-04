package com.joa.sht.gym_zip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.Count;
import com.joa.sht.gym_zip.vo.ReExerciseFilter;
import com.joa.sht.gym_zip.vo.RepresentExercise;

public class RepresentExercisesDAO {

	public static List<RepresentExercise> selectFilter(ReExerciseFilter ef) {
		
		SqlSession session = null;
		
		try {
			session=SqlSessionUtil.getSession();
			return session.selectList("representExercise.selectFilter", ef);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	public static Count selectFilterCount(ReExerciseFilter ef) {
	
		SqlSession session = null;
		
		try {
			session=SqlSessionUtil.getSession();
			return session.selectOne("representExercise.selectFilterCount", ef);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	public static RepresentExercise selectOne(int no) {
		
		SqlSession session = null;
		
		try {
			session=SqlSessionUtil.getSession();
			return session.selectOne("representExercise.selectOne", no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	
	public static List<RepresentExercise> selectDuplicateCheck(RepresentExercise reEx){
		

		SqlSession session = null;
		
		try {
			session=SqlSessionUtil.getSession();
			return session.selectList("representExercise.selectDuplicateCheck", reEx);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
		
	}
	
	//코치가 운동 등록시 대표운동이 등록됨 wow
	
	public static int insertReEx(RepresentExercise reEx) {
		

		SqlSession session = null;
		
		try {
			session=SqlSessionUtil.getSession();
			return session.insert("representExercise.insertReEx",reEx);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return 0;
	}
	
	
}
