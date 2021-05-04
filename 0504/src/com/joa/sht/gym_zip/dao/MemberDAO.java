package com.joa.sht.gym_zip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.ExRecord;
import com.joa.sht.gym_zip.vo.ExRecordPhoto;
import com.joa.sht.gym_zip.vo.LecturePayment;
import com.joa.sht.gym_zip.vo.Member;

public class MemberDAO {

	
	public static Member selectLogin(Member member) {
		
		SqlSession session = null;
		
		try {
			session=SqlSessionUtil.getSession();
			return session.selectOne("members.selectLogin", member);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}
	
	
	
	
	// 이메일 중복 확인 
	public static int checkEmail(String email) {
		
		SqlSession session = null;
		
		try {
			session=SqlSessionUtil.getSession();
			return session.selectOne("members.checkEmail", email);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return 0;
	}// end 이메일 중복 확인 
	
	//========================================================
	// 회원 가입 시 멤버 insert
	// 0114 오승주
	// 작성 했습니다~
	
	public static int joinMember(Member member) {
		
		SqlSession session = null;
		
		try {
			session=SqlSessionUtil.getSession();
			return session.insert("members.joinMember",member);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return -1;
	}// 멤버 가입
	
	//==========================================================
	
	
	//2021-01-14-16:34
	//멤버티어 이름가져오기
	public static String memberTier(int no) {
		
		SqlSession session=null;
		
		try {
			session= SqlSessionUtil.getSession();
			return session.selectOne("members.memberTier", no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}//멤버티어가져오기 end
	
	
	//최근운동기록가져오기
	 public static ExRecord getRecentExRecord(int no) {
		 SqlSession session = null;
		 
		 try {
			session=SqlSessionUtil.getSession();
			return session.selectOne("members.getRecentExRecord", no);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		 
		 
		 return null;
	 }
	 
	 //칼로리 전체 합 가져오기
	 public static int sumKcal(int no) {
		 SqlSession session = null;
		 
		 try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("members.sumKcal", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		 
		 return 0;
	 }
	 
	 //운동전체기록 가져오기
	 public static ExRecord getExRecord(ExRecord record) {
		 
		 SqlSession session = null;
		 
		 try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("members.getExRecord", record);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		 
		 return null;
	 }

	 
	 // 0122 강의 결제 (수강생 에너지 차감)
			public static int updateMemberLecturePayment(LecturePayment lecturePayment) {
				
				SqlSession session =null;
				
				try {
					session = SqlSessionUtil.getSession();
					return session.update("members.updateMemberLecturePayment",lecturePayment);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					session.close();
				}
				
				return 0;
			}
			
			// end 0122 강의 결제 (수강생 에너지 차감 )
			
			
	// 0122 강의 결제(코치 에너지 상승)
			public static int updateCoachLecturePayment(LecturePayment lecturePayment) {
				
				SqlSession session =null;
				
				try {
					session = SqlSessionUtil.getSession();
					return session.update("members.updateCoachLecturePayment",lecturePayment);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					session.close();
				}
				
				return 0;
			}
	// end 0122 강의 결제 (코치 에너지 상승 )
			
			
			// 0126  운동 기록 사진 의 총 개수 
			public static int selectExRecordPhotoTotal(int no) {
				
				SqlSession session =null;
				
				try {
					session = SqlSessionUtil.getSession();
					return session.selectOne("members.selectExRecordPhotoTotal",no);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					session.close();
				}
				
				return 0;
			}
			
			//0126 운동 기록 사진 
			public static List<ExRecordPhoto> selectExRecordPhotoList(int no) {
				
				SqlSession session =null;
				
				try {
					session = SqlSessionUtil.getSession();
					return session.selectList("members.selectExRecordPhotoList",no);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					session.close();
				}
				
				return null;
			}
			
			
			//
			
			//0126 운동 기록 사진(파노라마) 
				public static List<ExRecordPhoto> selectPanoramaList(int no) {
					
					SqlSession session =null;
					
					try {
						session = SqlSessionUtil.getSession();
						return session.selectList("members.selectPanoramaList",no);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						session.close();
					}
					
					return null;
				}
				
				//0129 멤버 에너지 업데이트 백경현
				public static int updateEnergyAdd(int no) {
					
					SqlSession session =null;
					
					try {
						session = SqlSessionUtil.getSession();
						return session.update("members.updateEnergyAdd",no);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						session.close();
					}
					
					return 0;
				}
				public static int updateEnergySub(int no) {
					
					SqlSession session =null;
					
					try {
						session = SqlSessionUtil.getSession();
						return session.update("members.updateEnergySub",no);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						session.close();
					}
					
					return 0;
				}
				
////////////////////////////////////////////////////////////////////////////////
// 0129 멤버 번호 얻어오기
public static int selectMemberNo(Member member) {

SqlSession session =null;

try {
session = SqlSessionUtil.getSession();
return session.selectOne("members.selectMemberNo",member);
} catch (Exception e) {
e.printStackTrace();
} finally {
session.close();
}

return 0;
}			

}
