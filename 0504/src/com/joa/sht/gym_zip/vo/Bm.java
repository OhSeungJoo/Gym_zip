package com.joa.sht.gym_zip.vo;

import java.sql.Timestamp;

public class Bm {

	
	private int no;
	private String bmCode, name;
	private Timestamp regdate, bmRegistDay;
	
	public Bm() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getBmCode() {
		return bmCode;
	}

	public void setBmCode(String bmCode) {
		this.bmCode = bmCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Timestamp getBmRegistDay() {
		return bmRegistDay;
	}

	public void setBmRegistDay(Timestamp bmRegistDay) {
		this.bmRegistDay = bmRegistDay;
	}
	
	
}
