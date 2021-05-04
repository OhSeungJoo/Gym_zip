package com.joa.sht.gym_zip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.Count;
import com.joa.sht.gym_zip.vo.Exercise;
import com.joa.sht.gym_zip.vo.Subscribe;

public class SubscribeDAO {

	public static List<Subscribe> subscribeCoachList(int no) {
		SqlSession session = null;
		
		try {
			session= SqlSessionUtil.getSession();
			return session.selectList("subscribe.selectCoachList", no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return null;
	}
	
	public static List<Exercise> selectSubscribeEx(int no){
		
		SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				return session.selectList("subscribe.selectSubscribeEx", no);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
		
		
		return null;
	}
	
	
	public static List<Subscribe> subscribeList(int no) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("subscribe.subscribeList", no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return null;
	}
	//백경현 구독수 0120
	public static Count selectSubscribeCount(int no) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("subscribe.selectSubscribeCount", no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return null;
	}
	
	public static int deleteSubscribeCoach(int no) {
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.delete("subscribe.deleteSubscribeCoach", no);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return 0;
	}
	
	
	//구독관계 여부 확인 0129백경현
		public static Count selectSubscribeCheck(Subscribe s) {
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.selectOne("subscribe.selectSubscribeCheck", s);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			
			return null;
		}
		//구독 추가 0129 백경현
		public static int insertSubscribe(Subscribe s) {		
			SqlSession session = null;

			try {
				session = SqlSessionUtil.getSession();
				return session.insert("subscribe.insertSubscribe", s);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return 0;
		}
		//구독 검색 0129 백경현
		public static Subscribe selectSubscribeNo(Subscribe s){
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				System.out.println("세션 얻음");
				return session.selectOne("subscribe.selectSubscribeNo", s);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return null;
		}
}
