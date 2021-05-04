package com.joa.sht.gym_zip.vo;

import java.sql.Timestamp;

public class Curriculum {
	private long no;
	private int exerciseNo,lectureNo,seq;
	private Timestamp reqdate;
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public int getExerciseNo() {
		return exerciseNo;
	}
	public void setExerciseNo(int exerciseNo) {
		this.exerciseNo = exerciseNo;
	}
	public int getLectureNo() {
		return lectureNo;
	}
	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public Timestamp getReqdate() {
		return reqdate;
	}
	public void setReqdate(Timestamp reqdate) {
		this.reqdate = reqdate;
	}
	public Curriculum() {
		// TODO Auto-generated constructor stub
	}

}
