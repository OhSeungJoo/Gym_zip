package com.joa.sht.gym_zip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.Count;
import com.joa.sht.gym_zip.vo.Exercise;
import com.joa.sht.gym_zip.vo.Keyword;
import com.joa.sht.gym_zip.vo.Lecture;
import com.joa.sht.gym_zip.vo.LectureListFilter;
import com.joa.sht.gym_zip.vo.LectureListStd;
import com.joa.sht.gym_zip.vo.PageVO;


public class LectureDAO {

	public static List<Lecture> selectMemberLecture(int no) {
		
		SqlSession session =null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("lecture.memberLecture", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}
	
	// 메인페이지 인기 강의 추천 
		// 0116
		// 오승주 작성 
		public static List<Lecture> selectLectureMainList() {
			
			SqlSession session =null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.selectList("lecture.selectLectureMainList");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return null;
		}
		// end 메인페이지 인기 강의 추천 
		
		
		
		
		// 강의 상세 페이지 select 구문 
		// 0117
		// 오승주 작성
		public static Lecture selectLectureDetail(int no) {
			
			SqlSession session =null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.selectOne("lecture.selectLectureDetail",no);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return null;
		}
		
		// end 강의 상세 페이지 
	
		
		//운동상세안에있는 강의 리스트 
		//0121 백경현
		public static List<Lecture> selectExerciseDetailLectureList(int no) {
			
			SqlSession session =null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.selectList("lecture.selectExerciseDetailLectureList",no);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return null;
		}
		
		//조용규 트레이닝룸 페이징처리 0118
	
			
		public static Count selectLectureTotal(int no) {
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.selectOne("lecture.selectLectureTotal", no);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return null; 
		}
			
		// 0122 강의 번호 이용 코치 번호와 강의 기간, 금액 구하기 
		public static Lecture selectLectureInform(int no) {
			
			SqlSession session =null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.selectOne("lecture.selectLectureInform",no);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return null;
		}
		// end 0122 강의 번호 이용 코치 번호와 강의 기간, 금액 구하기 
		
		
	// 0123 강의 수강신청시 남자 여자 수 증가 시키기 
		public static int updateLectureMemberNum(int no) {
			
			SqlSession session =null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.update("lecture.updateLectureMemberNum",no);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return 0;
		}
		
	//0124 강의의 총 운동 횟수 10번 미만시 운동더미에서 칼로리 구하기 (여자)
		public static int selectFemaleKcalDummy(int no) {
			
			SqlSession session =null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.selectOne("lecture.selectFemaleKcalDummy",no);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return 0;
		}	
		
// 0124 강의 운동 10번 미만일 때 남자 칼로리 구하기 
		public static int selectMaleKcalDummy(int no) {
			
			SqlSession session =null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.selectOne("lecture.selectMaleKcalDummy",no);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return 0;
		}	
		
		
//0125 강의 카드 가져오기(default)
		public static List<Lecture> selectLectureCardList(LectureListFilter lectureListFilter) {
			
			SqlSession session =null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.selectList("lecture.selectLectureCardList",lectureListFilter);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return null;
		}	
				
// end 강의 카드 가져오기 
			
		
		
//0125 강의 수 구하기	
	public static int selectLectureNum() {
	
		SqlSession session =null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("lecture.selectLectureNum");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return 0;
	}
	
	// 0125 선택한 것 에 따라 강의 개수 구하기 
	public static int selectLectureCardCount(LectureListFilter lectureListFilter) {
		
		SqlSession session =null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("lecture.selectLectureCardCount",lectureListFilter);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return 0;
	}
	
	// 0125 강의 홍보 이미지 
	public static List<String> selectLectureAdImageList(int no) {
		
		SqlSession session =null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("lecture.selectLectureAdImageList",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}
	//0126 강의 등록  백경현
	public static int insertLecture(Lecture l) {
		
		SqlSession session =null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("lecture.insertLecture", l);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return 0;
	}
	public static List<Lecture> selectLectureNo(Lecture l) {
		
		SqlSession session =null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("lecture.selectLectureNo",l);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	
	//0130백경현
	//강의 검색
				
	public static List<Lecture> selectbyKeyword(Keyword k) {
		SqlSession session =null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("lecture.selectbyKeyword", k);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
				
	//0206 박해원
	//강의 페이징 리스트 
	public static List<Lecture> selectCoachLecturePagingList(PageVO page) {
		
		SqlSession session =null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("lecture.selectCoachLecturePagingList", page);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	
	//0206 박해원
	//강의 갯수 카운팅 
	public static int selectCoachLectureListCount(int no) {
		
		SqlSession session =null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("lecture.selectCoachLectureListCount",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return 0;
	}
	
	//0206
	//강의 공개 비공개 업데이트
	
	
	public static int updateLectureOnOff(Lecture lec) {
		SqlSession session = null;

		try {
			session=SqlSessionUtil.getSession();
			return session.update("lecture.updateLectureOnOff", lec);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return 0;
		
	}//updateOnOff() END
}
