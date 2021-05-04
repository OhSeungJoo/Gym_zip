package com.joa.sht.gym_zip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.CoachExerciseListFilter;
import com.joa.sht.gym_zip.vo.Count;
import com.joa.sht.gym_zip.vo.Exercise;
import com.joa.sht.gym_zip.vo.Keyword;
import com.joa.sht.gym_zip.vo.Lecture;
import com.joa.sht.gym_zip.vo.Step;
import com.joa.sht.gym_zip.vo.WhoseExercise;

public class ExerciseDAO {

	// 메인 페이지 인기 운동 추천 
	// 0116 
	// 오승주 작성 
	public static List<Exercise> selectMainExerciseList() {

		SqlSession session =null;

		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("exercise.selectMainExerciseList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}

	// end 메인 페이지 인기 운동 추천 

	public static List<Exercise> selectExerciseList(Step st) {

		SqlSession session = null;

		try {
			session=SqlSessionUtil.getSession();
			return session.selectList("exercise.selectExerciseList", st);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	
	public static Exercise selectExerciseDetail(int no) {

		SqlSession session = null;

		try {
			session=SqlSessionUtil.getSession();
			return session.selectOne("exercise.selectExerciseDetail", no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	public static Count selectExerciseCardCount(int no) {

		SqlSession session = null;

		try {
			session=SqlSessionUtil.getSession();
			return session.selectOne("exercise.selectExerciseCardCount", no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	
	//0123 커리큘럼 출력  오승주 
	public static List<Exercise> selectCurriculum(int no) {

		SqlSession session = null;

		try {
			session=SqlSessionUtil.getSession();
			return session.selectList("exercise.selectCurriculum", no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	

	//0125 박해원 
	//운동등록
	public static int insertEx(Exercise ex) {
		
		SqlSession session = null;

		try {
			session=SqlSessionUtil.getSession();
			return session.insert("exercise.insertEx",ex);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return 0;
		
	}//insertEx(Exercise ex) END
	
	
	
	//0125 박해원
	// 운동번호를 얻어내기위한 selectList
	public static List<Exercise> selectExNoList(Exercise ex) {

		SqlSession session =null;

		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("exercise.selectExNoList",ex);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}//selectExNoList() END
	
	//0124 백경현 작성
		//코치의 운동 조회
		public static List<Exercise> selectExerciseByCoachAndPart(WhoseExercise we) {

			SqlSession session = null;

			try {
				session=SqlSessionUtil.getSession();
				return session.selectList("exercise.selectExerciseByCoachAndPart", we);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return null;
		}
		
		
		//0128 박해원
		//코치가  올린 운동목록을 볼때 SELECT
		public static List<Exercise> selectCoachExList(CoachExerciseListFilter cel) {

			SqlSession session = null;

			try {
				session=SqlSessionUtil.getSession();
				return session.selectList("exercise.selectCoachExList", cel);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return null;
			
		}//selectCoachExList() END
		
		
		//0128 박해원
		//코치가  올린 운동목록을 페이징 하기위해 운동갯수를 구하는는 SELECT
		public static int selectCoachExListCount(int no) {

			SqlSession session = null;

			try {
				session=SqlSessionUtil.getSession();
				return session.selectOne("exercise.selectCoachExListCount", no);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return 0;
		}//selectCoachExListCount() END

		
		
		public static int updateOnOff(Exercise ex) {
			SqlSession session = null;

			try {
				session=SqlSessionUtil.getSession();
				return session.update("exercise.updateOnOff", ex);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return 0;
			
		}//updateOnOff() END
		
		//0130백경현
				//코치 검색
					
				public static List<Exercise> selectbyKeyword(Keyword k) {
					SqlSession session =null;
					try {
						session = SqlSessionUtil.getSession();
						return session.selectList("exercise.selectbyKeyword", k);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						session.close();
					}
					return null;
				}
}
