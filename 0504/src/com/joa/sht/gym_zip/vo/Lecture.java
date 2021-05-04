package com.joa.sht.gym_zip.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Lecture {
	
//NO	FE_KCAL	TITLE	MALE_KCAL	LEVELS	COST	PERIOD	AVG_RATING	TARGET_GENDER	TIMES	THUMBNAIL	INTRODUCTION	RECOMMAND	COACH_NO	REGDATE	MALE_NUM	FEMALE_NUM	ON_OFF	VIEW_COUNT	

	private int no,feKcal,maleKcal,cost,period,times,viewCount,coachNo,maleNum,femaleNum, memberNo, reviewNo;
	private String title,thumbnail,introduction,recommand,type,onOff,levels,targetGender, nickname, tierName;
	private double avgRating;
	private Date startDate,endDate;
	
	// 0125 Lecture 필드, 메서드 추가  추가 
		private int kcal;

		public int getKcal() {
			return kcal;
		}

		public void setKcal(int kcal) {
			this.kcal = kcal;
		}
	
	
	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

		// 필드 추가했습니다 ~~~~
		// 0117
		// 오승주 작성 (강의 상세 에 필요 )
		private String profileImg; // 코치 프로필 이미지, 닉네임, 티어이름
		private int totalKcal; // 전체 칼로리 평균수
		// ============================
	

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

	private Timestamp regdate;
	
	public Lecture() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getFeKcal() {
		return feKcal;
	}

	public void setFeKcal(int feKcal) {
		this.feKcal = feKcal;
	}

	public int getMaleKcal() {
		return maleKcal;
	}

	public void setMaleKcal(int maleKcal) {
		this.maleKcal = maleKcal;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getCoachNo() {
		return coachNo;
	}

	public void setCoachNo(int coachNo) {
		this.coachNo = coachNo;
	}

	public int getMaleNum() {
		return maleNum;
	}

	public void setMaleNum(int maleNum) {
		this.maleNum = maleNum;
	}

	public int getFemaleNum() {
		return femaleNum;
	}

	public void setFemaleNum(int femaleNum) {
		this.femaleNum = femaleNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getRecommand() {
		return recommand;
	}

	public void setRecommand(String recommand) {
		this.recommand = recommand;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getOnOff() {
		return onOff;
	}

	public void setOnOff(String onOff) {
		this.onOff = onOff;
	}

	public String getLevels() {
		return levels;
	}

	public void setLevels(String levels) {
		this.levels = levels;
	}
	

	public String getTargetGender() {
		return targetGender;
	}

	public void setTargetGender(String targetGender) {
		this.targetGender = targetGender;
	}

	public double getAvgRating() {
		return avgRating;
	}

	public void setAvgRating(double avgRating) {
		this.avgRating = avgRating;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	//================================================================
		// 0117 오승주
		// 추가한 필드의 setter,getter 추가 
		public String getProfileImg() {
			return profileImg;
		}

		public void setProfileImg(String profileImg) {
			this.profileImg = profileImg;
		}
		
		public int getTotalKcal() {
			
			int femaleTotalKcal,maleTotalKcal;
			
			if(this.femaleNum==0) {
				femaleTotalKcal=0;
			}else {
				femaleTotalKcal=this.feKcal*this.femaleNum;
			}// female if~ else end 
			
			
			if(this.maleNum==0) {
				maleTotalKcal=0;
			}else {
				maleTotalKcal=this.maleKcal*this.maleNum;
			}// male if~else end 
			
			
			if(maleTotalKcal+femaleTotalKcal==0) {
				return 0;
			}
			else {
				return (femaleTotalKcal+maleTotalKcal)/(this.femaleNum+this.maleNum);
			}
			
			
			
			
		}

		public void setTotalKcal(int totalKcal) {
			this.totalKcal = totalKcal;
			
			
		}
	

}
