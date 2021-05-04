package com.joa.sht.gym_zip.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Coaching {
	
	private long no;
	private int memberNo, coachNo;
	private Timestamp coachingDate;
	private String okToggle, rejectReason, nickname;
	private Timestamp regdate;
	private Timestamp calendarStart,calendarEnd;

	
	
	
	public Coaching(int coachNo, Timestamp calendarStart, Timestamp calendarEnd) {
		this.coachNo = coachNo;
		this.calendarStart = calendarStart;
		this.calendarEnd = calendarEnd;
	}
	

	public Coaching(Timestamp calendarStart, Timestamp calendarEnd, int memberNo) {
		super();
		this.memberNo = memberNo;
		this.calendarStart = calendarStart;
		this.calendarEnd = calendarEnd;
	}
	
	public Coaching(int coachNo, Timestamp coachingDate) {
		this.coachNo = coachNo;
		this.coachingDate = coachingDate;
	}
	
	

	public Coaching(int coachNo, Timestamp coachingDate, String rejectReason) {
		this.coachNo = coachNo;
		this.coachingDate = coachingDate;
		this.rejectReason = rejectReason;
	}


	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public Timestamp getCalendarStart() {
		return calendarStart;
	}


	public void setCalendarStart(Timestamp calendarStart) {
		this.calendarStart = calendarStart;
	}


	public Timestamp getCalendarEnd() {
		return calendarEnd;
	}


	public void setCalendarEnd(Timestamp calendarEnd) {
		this.calendarEnd = calendarEnd;
	}


	public Coaching() {
		// TODO Auto-generated constructor stub
	}

	public Coaching(int memberNo, int coachNo, Timestamp coachingDate) {
		super();
		this.memberNo = memberNo;
		this.coachNo = coachNo;
		this.coachingDate = coachingDate;
	}

	

	public long getNo() {
		return no;
	}

	public void setNo(long no) {
		this.no = no;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getCoachNo() {
		return coachNo;
	}

	public void setCoachNo(int coachNo) {
		this.coachNo = coachNo;
	}

	public String getOkToggle() {
		return okToggle;
	}

	public void setOkToggle(String okToggle) {
		this.okToggle = okToggle;
	}

	public Timestamp getCoachingDate() {
		return coachingDate;
	}

	public void setCoachingDate(Timestamp coachingDate) {
		this.coachingDate = coachingDate;
	}

	public String getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
}
