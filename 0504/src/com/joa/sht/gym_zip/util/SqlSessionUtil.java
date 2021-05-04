package com.joa.sht.gym_zip.util;

import java.io.Reader;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionUtil {
	
	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/joa/sht/gym_zip/config/mybatis-config.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
		}catch (Exception e) {
			e.printStackTrace();
		}//try~catch
	}
	/*
	 * 인스턴스 멤버가 할 일이 있다면 생성자에 쓴다
	 *	스태틱 멤버가 할일은 스태틱 영역에 쓴다. 
	 * 
	 */
	public static SqlSession getSession() {
		return factory.openSession(true);
		//true : auto commit
	}	
}
