package com.joa.sht.gym_zip.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class LectureListStd {
	
	//NO	LECTURE_NO	MEMBER_NO	PERIOD	START_DATE	END_DATE	MY_KCAL	REGDATE	VIEW_COUNT	

	private int no, lectureNo,memberNo,period,myKcal,viewCount;
	private String title, nickname, tierName;
	private Date startDate,endDate;
	
	public LectureListStd() {
		// TODO Auto-generated constructor stub
	}
	// 0122 생성자 추가 
	public LectureListStd(int lectureNo,int memberNo) {
		this.lectureNo=lectureNo;
		this.memberNo=memberNo;
		
	}
	public LectureListStd(int memberNo, int no, Date startDate) {
		this.no = no;
		this.memberNo = memberNo;
		this.startDate = startDate;
	}
	public String getTitle() {
		return title;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTierName() {
		return tierName;
	}

	public void setTierName(String tierName) {
		this.tierName = tierName;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public int getMyKcal() {
		return myKcal;
	}

	public void setMyKcal(int myKcal) {
		this.myKcal = myKcal;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	

}
