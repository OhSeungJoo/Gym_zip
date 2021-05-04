package com.joa.sht.gym_zip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.Coach;
import com.joa.sht.gym_zip.vo.CoachListFilter;
import com.joa.sht.gym_zip.vo.CoachMain;
import com.joa.sht.gym_zip.vo.CoachSearch;
import com.joa.sht.gym_zip.vo.ExRecord;
import com.joa.sht.gym_zip.vo.Keyword;
import com.joa.sht.gym_zip.vo.LectureListStd;

public class CoachDAO {

	// 0116 작성
	// 메인 코치 추천 리스트
	// 오승주
	// 메인 코치 추천
	public static List<CoachMain> coachMainSelect() {

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("coach.coachMainSelect");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}

	// end 메인 코치 추천
	// 0116작성
	// 코치리스트
	// 박해원
	public static List<Coach> selectList(CoachListFilter cf) {

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("coach.selectList", cf);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}

	// 0123작성
	// 코치수 SELECT
	// 박해원
	public static int selectCoachTotal(CoachListFilter cf) {

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("coach.selectCoachTotal", cf);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return 0;
	}// selectCoachTotal() END

	// 0129 작성
	// 코치마이페이지에 필요한 데이터 Select
	// 박해원
	public static List<Coach> selectCoachMyPage(int coachNo) {

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("coach.selectCoachMyPage", coachNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}// selectCoachMyPage() END

	// 0129 회원 가입시 코치테이블에도 튜플작성
	public static int insertJoinCoach(int no) {

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			return session.insert("coach.insertJoinCoach", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return 0;
	}

	// 0130 작성
	// 코치마이페이지에 코치의 최고,최대운동기록 데이터를 Select
	// 박해원
	public static List<ExRecord> selectBestExrecord(int coachNo) {

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("coach.selectBestExrecord", coachNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}// selectBestExrecord() END

	// 0130 작성
	// 코치마이페이지에 코치의 최신운동기록 데이터를 Select
	// 박해원
	public static List<ExRecord> selectLastExrecord(int coachNo) {

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("coach.selectLastExrecord", coachNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}// selectLastExrecord() END

	// 0130 작성
	// 코치마이페이지에 코치의 사진들을 Select
	// 박해원
	public static List<Coach> selectCoachImage(int coachNo) {

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("coach.selectCoachImage", coachNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}// selectCoachImage() END

	// 0130백경현
	// 코치 검색

	public static List<CoachSearch> selectbyKeyword(Keyword k) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("coach.selectbyKeyword", k);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	// 0207작성
	// 코칭 가능 요일 SELECT
	// 박해원
	public static List<Coach> selectCoachingAvailable(int no) {

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("coach.selectCoachingAvailable", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}// selectCoachingAvailable() END
}
