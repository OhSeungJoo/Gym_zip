package com.joa.sht.gym_zip.vo;

import java.sql.Timestamp;

public class Exercise {
	private int no, exerciseNo, setNum,maleNum,femaleNum,maleKcal,feKcal,coachNo,exCount,exWeight,viewCount;
	private String name,url,levels,onOff,free,thumbnail,bmOnOff,targetGender;
	private Timestamp regdate;


	//데이터베이스 외로 출력시 필요한 맴버필드
	private int manKcal,womanKcal;
	private double manHeight, manWeight, womanHeight, womanWeight,avgKcal;
	private String coachNickname, tierName;
	private String coachImage;
	
	
	
	public Exercise() {
		// TODO Auto-generated constructor stub
	}
	
	//0129 박해원 생성자 추가
	public Exercise(int no, String onOff) {
		this.exerciseNo = no;
		this.onOff = onOff;
	}
	
	
	// 0125 운동 시간 추가 ========================
		private String exerciseTime;
		
		public String getExerciseTime() {
			return exerciseTime;
		}
		public void setExerciseTime(String exerciseTime) {
			this.exerciseTime = exerciseTime;
		}
		//=============================================
		
	public String getCoachImage() {
		return coachImage;
	}
	public void setCoachImage(String coachImage) {
		this.coachImage = coachImage;
	}
	public int getManKcal() {
		return manKcal;
	}
	public void setManKcal(int manKcal) {
		this.manKcal = manKcal;
	}
	public int getWomanKcal() {
		return womanKcal;
	}
	public void setWomanKcal(int womanKcal) {
		this.womanKcal = womanKcal;
	}
	public double getManHeight() {
		return manHeight;
	}
	public void setManHeight(double manHeight) {
		this.manHeight = manHeight;
	}
	public double getManWeight() {
		return manWeight;
	}
	public void setManWeight(double manWeight) {
		this.manWeight = manWeight;
	}
	public double getWomanHeight() {
		return womanHeight;
	}
	public void setWomanHeight(double womanHeight) {
		this.womanHeight = womanHeight;
	}
	public double getWomanWeight() {
		return womanWeight;
	}
	public void setWomanWeight(double womanWeight) {
		this.womanWeight = womanWeight;
	}
	public double getAvgKcal() {
		return avgKcal;
	}
	public void setAvgKcal(double avgKcal) {
		this.avgKcal = avgKcal;
	}
	public String getCoachNickname() {
		return coachNickname;
	}
	public void setCoachNickname(String coachNickname) {
		this.coachNickname = coachNickname;
	}
	public String getTierName() {
		return tierName;
	}
	public void setTierName(String tierName) {
		this.tierName = tierName;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getExerciseNo() {
		return exerciseNo;
	}
	public void setExerciseNo(int exerciseNo) {
		this.exerciseNo = exerciseNo;
	}
	public int getSetNum() {
		return setNum;
	}
	public void setSetNum(int setNum) {
		this.setNum = setNum;
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
	public int getMaleKcal() {
		return maleKcal;
	}
	public void setMaleKcal(int maleKcal) {
		this.maleKcal = maleKcal;
	}
	public int getFeKcal() {
		return feKcal;
	}
	public void setFeKcal(int feKcal) {
		this.feKcal = feKcal;
	}
	public int getCoachNo() {
		return coachNo;
	}
	public void setCoachNo(int coachNo) {
		this.coachNo = coachNo;
	}
	public int getExCount() {
		return exCount;
	}
	public void setExCount(int exCount) {
		this.exCount = exCount;
	}
	public int getExWeight() {
		return exWeight;
	}
	public void setExWeight(int exWeight) {
		this.exWeight = exWeight;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getLevels() {
		return levels;
	}
	public void setLevels(String levels) {
		this.levels = levels;
	}
	public String getOnOff() {
		return onOff;
	}
	public void setOnOff(String onOff) {
		this.onOff = onOff;
	}
	public String getFree() {
		return free;
	}
	public void setFree(String free) {
		this.free = free;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getBmOnOff() {
		return bmOnOff;
	}
	public void setBmOnOff(String bmOnOff) {
		this.bmOnOff = bmOnOff;
	}
	public String getTargetGender() {
		return targetGender;
	}
	public void setTargetGender(String targetGender) {
		this.targetGender = targetGender;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	

}
