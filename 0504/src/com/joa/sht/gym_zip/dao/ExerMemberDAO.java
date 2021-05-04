package com.joa.sht.gym_zip.dao;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.ExDummy;
import com.joa.sht.gym_zip.vo.ExerMember;

public class ExerMemberDAO {

	//0129 백경현
	//구독 등록시 멤버와 운동 관계추가 insert
	public static int insertExerMember(ExerMember em) {
		
	
		SqlSession session = null;
		
		try {
			session=SqlSessionUtil.getSession();
			return session.insert("exerMember.insertExerMember", em);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return 0;
		
	}//insertEd() END
	
}//ExDummyDAO END
