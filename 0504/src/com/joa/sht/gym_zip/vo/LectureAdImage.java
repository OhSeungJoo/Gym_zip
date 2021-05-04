package com.joa.sht.gym_zip.vo;

import java.sql.Timestamp;

public class LectureAdImage {
	
	//NO	URL	LECTURE_NO	REGDATE	

	
	private int no,lectureNo;
	private String url;
	private Timestamp regdate;
	
	public LectureAdImage() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getLectureNo() {
		return lectureNo;
	}

	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	

}
