package com.joa.sht.gym_zip.dao;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.Curriculum;
import com.joa.sht.gym_zip.vo.Lecture;

public class CurriculumDAO {
	//0126 커리큘럼 등록  백경현
			public static int insertCurriculum(Curriculum c) {
				
				SqlSession session =null;
				
				try {
					session = SqlSessionUtil.getSession();
					return session.insert("curriculum.insertCurriculum", c);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					session.close();
				}
				return 0;
			}
	
}
