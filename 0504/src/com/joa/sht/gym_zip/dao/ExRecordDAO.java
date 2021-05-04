package com.joa.sht.gym_zip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.joa.sht.gym_zip.util.SqlSessionUtil;
import com.joa.sht.gym_zip.vo.ExRecord;

public class ExRecordDAO {

	public static List<ExRecord> getExRecord(ExRecord exRecord) {
		
		SqlSession session =null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("exRecord.getExRecord", exRecord);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return null;
	}
	
	public static ExRecord getClickRecord(ExRecord exRecord) {
		
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			return session.selectOne("exRecord.getClickRecord", exRecord);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return null;
	}
	
}
