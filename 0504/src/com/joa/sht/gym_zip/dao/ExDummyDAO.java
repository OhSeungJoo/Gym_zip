package com.joa.sht.gym_zip.dao;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.ExDummy;

public class ExDummyDAO {

	//0125 박해원
	//운동 등록시 운동더미 insert
	public static int insertEd(ExDummy ed) {
		
	
		SqlSession session = null;
		
		try {
			session=SqlSessionUtil.getSession();
			return session.insert("ExDummy.insertExDummy", ed);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return 0;
		
	}//insertEd() END
	
}//ExDummyDAO END
