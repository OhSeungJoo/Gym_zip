package com.joa.sht.gym_zip.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Career {

	
	private int no, coachNo;
	private Date endDate, startDate;
	private String company;
	private Timestamp regdate;
	
	public Career() {
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

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
