package com.joa.sht.gym_zip.vo;

import java.sql.Timestamp;

public class ExerMember {
	private int exerciseNo, memberNo, viewCount;
	private long no;
	private Timestamp regdate;
	
	
	public int getExerciseNo() {
		return exerciseNo;
	}


	public void setExerciseNo(int exerciseNo) {
		this.exerciseNo = exerciseNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public int getViewCount() {
		return viewCount;
	}


	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}


	public long getNo() {
		return no;
	}


	public void setNo(long no) {
		this.no = no;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}


	public ExerMember() {
		// TODO Auto-generated constructor stub
	}

	
}
