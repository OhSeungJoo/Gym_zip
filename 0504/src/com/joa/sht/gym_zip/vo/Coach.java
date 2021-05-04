package com.joa.sht.gym_zip.vo;

import java.sql.Timestamp;

public class Coach {

	private int no, cost, coachTierNo;
	private String nickname, adText;
	private Timestamp regdate;
	
	//추가한 멤버필드
		private int kcalTotal;
		private String tier,coachImage;
		
		
	//코칭 가능 날짜 관련 멤버필드
	private int mondayOnOff, tuesdayOnOff, wednesdayOnOff, thursdayOnOff, fridayOnOff, saturdayOnOff, sundayOnOff;
	
	// 코칭 평점 관련 멤버필드
	private int reviewNum,sumCurriculum, sumDelivery, sumTime, sumPrepare, sumKindness;
	private double avgScore;
	
	// 코치가 보유한 운동들의 뷰카운트 합
	private int viewCountSum;
	
	// 0130 박해원  코치의 성별
	private String gender;
	private String coachAdImage;
	

	public String getCoachAdImage() {
		return coachAdImage;
	}

	public void setCoachAdImage(String coachAdImage) {
		this.coachAdImage = coachAdImage;
	}

	public Coach() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getCoachTierNo() {
		return coachTierNo;
	}

	public void setCoachTierNo(int coachTierNo) {
		this.coachTierNo = coachTierNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAdText() {
		return adText;
	}

	public void setAdText(String adText) {
		this.adText = adText;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getKcalTotal() {
		return kcalTotal;
	}

	public void setKcalTotal(int kcalTotal) {
		this.kcalTotal = kcalTotal;
	}

	public String getCoachImage() {
		return coachImage;
	}

	public void setCoachImage(String coachImage) {
		this.coachImage = coachImage;
	}
	
	public String getTier() {
		
		if(tier.equals("연습생")) {
			
			return "<span style='color:#424242'>연습생</span>";
		
		}else if(tier.equals("트레이너")){
			
			return "<span style='color:#c0392b'>트레이너</span>";
			
		}else if(tier.equals("시니어")){
			
			return "<span style='color:#9e9e9e'>시니어</span>";
			
		}else if(tier.equals("팀장")){
			
			return "<span style='color:#f1c40f'>팀장</span>";
			
		}else if(tier.equals("매니저")){
			
			return "<span style='color:#0cdad5'>매니저</span>";
			
		}else {

			return "<span style='color:#a3ceeb'>관장</span>";
			
		}
		
	}

	public void setTier(String tier) {
		this.tier = tier;
	}
	
	
	//코칭 가능요일 멤버필드 getter,setter
	//0118

	public int getMondayOnOff() {
		return mondayOnOff;
	}

	public void setMondayOnOff(int mondayOnOff) {
		this.mondayOnOff = mondayOnOff;
	}

	public int getTuesdayOnOff() {
		return tuesdayOnOff;
	}

	public void setTuesdayOnOff(int tuesdayOnOff) {
		this.tuesdayOnOff = tuesdayOnOff;
	}

	public int getWednesdayOnOff() {
		return wednesdayOnOff;
	}

	public void setWednesdayOnOff(int wednesdayOnOff) {
		this.wednesdayOnOff = wednesdayOnOff;
	}

	public int getThursdayOnOff() {
		return thursdayOnOff;
	}

	public void setThursdayOnOff(int thursdayOnOff) {
		this.thursdayOnOff = thursdayOnOff;
	}

	public int getFridayOnOff() {
		return fridayOnOff;
	}

	public void setFridayOnOff(int fridayOnOff) {
		this.fridayOnOff = fridayOnOff;
	}

	public int getSaturdayOnOff() {
		return saturdayOnOff;
	}

	public void setSaturdayOnOff(int saturdayOnOff) {
		this.saturdayOnOff = saturdayOnOff;
	}

	public int getSundayOnOff() {
		return sundayOnOff;
	}

	public void setSundayOnOff(int sundayOnOff) {
		this.sundayOnOff = sundayOnOff;
	}
	//코칭 가능요일 멤버필드 getter,setter END
	
		
	//코치리스트 평점 멤버필드 getter,setter
	
	
	public double getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(double avgScore) {
		
			this.avgScore = avgScore;
		
	}
	
	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getSumCurriculum() {
		return sumCurriculum;
	}

	public void setSumCurriculum(int sumCurriculum) {
		this.sumCurriculum = sumCurriculum;
	}

	public int getSumDelivery() {
		return sumDelivery;
	}

	public void setSumDelivery(int sumDelivery) {
		this.sumDelivery = sumDelivery;
	}

	public int getSumTime() {
		return sumTime;
	}

	public void setSumTime(int sumTime) {
		this.sumTime = sumTime;
	}

	public int getSumPrepare() {
		return sumPrepare;
	}

	public void setSumPrepare(int sumPrepare) {
		this.sumPrepare = sumPrepare;
	}

	public int getSumKindness() {
		return sumKindness;
	}

	public void setSumKindness(int sumKindness) {
		this.sumKindness = sumKindness;
	}

	
	//코치리스트 평점 멤버필드 getter,setter END
	

	
	// 코치가 보유한 운동들의 뷰카운트 합
	public int getViewCountSum() {
		return viewCountSum;
	}

	public void setViewCountSum(int viewCountSum) {
		this.viewCountSum = viewCountSum;
	}
	
	//// 코치가 보유한 운동들의 뷰카운트 합 END
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
