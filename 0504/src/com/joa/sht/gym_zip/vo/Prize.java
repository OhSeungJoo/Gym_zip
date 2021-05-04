package com.joa.sht.gym_zip.vo;

import java.sql.Timestamp;

public class Prize {

	int no, coachNo; // 기본키번호, 코치 번호
	String text; // 수상내역
	Timestamp regdate; 
	
	public Prize() {
		// TODO Auto-generated constructor stub
	}

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

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
