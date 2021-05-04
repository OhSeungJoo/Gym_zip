package com.joa.sht.gym_zip.vo;

import java.sql.Timestamp;

public class CoachQualification {
	private int no, coachNo, qualifyNo;
	private String qualifyImg;
	private Timestamp regdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCoachNo() {
		return coachNo;
	}
	public void setCoachNo(int coachNo) {
		this.coachNo = coachNo;
	}
	public int getQualifyNo() {
		return qualifyNo;
	}
	public void setQualifyNo(int qualifyNo) {
		this.qualifyNo = qualifyNo;
	}
	public String getQualifyImg() {
		return qualifyImg;
	}
	public void setQualifyImg(String qualifyImg) {
		this.qualifyImg = qualifyImg;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public CoachQualification() {
		// TODO Auto-generated constructor stub
	}
}
