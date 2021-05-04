package com.joa.sht.gym_zip.vo;
// LectureReviewContent vo 작성
// 강의 상세에 필요할 것 같아 작성 
// 0117 오승주 작성 

import java.sql.Timestamp;

public class LectureReviewContent {
	private int myKcal;  // 내 소모 칼로리 
	private String nickname,profileImg,tier,contents; // 별명, 프로필 사진, 티어, 내용
	private String regdate; // 작성일 
	
	
	public LectureReviewContent() {
		// TODO Auto-generated constructor stub
	}


	public int getMyKcal() {
		return myKcal;
	}


	public void setMyKcal(int myKcal) {
		this.myKcal = myKcal;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getProfileImg() {
		return profileImg;
	}


	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}


	public String getTier() {
		return tier;
	}


	public void setTier(String tier) {
		this.tier = tier;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
