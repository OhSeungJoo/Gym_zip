package com.joa.sht.gym_zip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.CAvailable;
import com.joa.sht.gym_zip.vo.Coaching;

public class CoachingDAO {

	public static int reserveCoaching(Coaching coaching) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("coaching.reserveCoaching", coaching);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return 0;
	}
	
	public static List<Coaching> getCoachingEvent(Coaching coaching){
	
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("coaching.getCoachingEvent",coaching);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	
	}
	
	public static List<Coaching> getCoachingEventTo(Coaching coaching){
		
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("coaching.getCoachingEventTo",coaching);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	
	}
	
	public static int acceptCoaching(Coaching coaching) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.update("coaching.acceptCoaching", coaching);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return 0;
	}
	
	public static int rejectCoaching(Coaching coaching) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.update("coaching.rejectCoaching", coaching);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return 0;
	}
	
	public static Coaching CoachingInfor(Coaching coaching) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("coaching.coachingInform", coaching);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}
	
	//0207
	//박해원 추가 
	public static int insertAvailable(CAvailable ca) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("cAvailables.insertAvailable", ca);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return 0;
	}
	
	//0207
	//박해원 추가 
		public static int deleteAvailable(int no) {
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.delete("cAvailables.deleteAvailable", no);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return 0;
		}

		// 0207
		// 박해원 추가 
		public static int updateAvailable(CAvailable ca) {

			SqlSession session = null;

			try {
				session = SqlSessionUtil.getSession();
				return session.update("cAvailables.updateAvailable", ca);

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}

			return 0;
		}

		// 0207
		// 박해원 추가
		public static int updateAvailableZero(int no) {

			SqlSession session = null;

			try {
				session = SqlSessionUtil.getSession();
				return session.update("cAvailables.updateAvailableZero", no);

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}

			return 0;
		}
}
