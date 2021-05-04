package com.joa.sht.gym_zip.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class ExRecord {
	private int kcal,highBpm,totalWeight,heaviest,memberNo,bmm,fatMass,fatRate,cLNo,exNo,coachNo;
	private double bmiBefore,bmiAfter,avgBpm,weight,muscleBone;
	private long no;
	private String type, name;
	
	//0130 박해원 멤버필드 추가
		private int sumSecond;//코치의 최대 운동시간
	
	public ExRecord(int memberNo) {
		super();
		this.memberNo = memberNo;
	}


	public int getSumSecond() {
		return sumSecond;
	}


	public void setSumSecond(int sumSecond) {
		this.sumSecond = sumSecond;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	private Timestamp startTime,endTime,regdate,noPrev, coachingDate;
	public int getCoachNo() {
		return coachNo;
	}


	public void setCoachNo(int coachNo) {
		this.coachNo = coachNo;
	}


	public Timestamp getCoachingDate() {
		return coachingDate;
	}


	public void setCoachingDate(Timestamp coachingDate) {
		this.coachingDate = coachingDate;
	}


	public Timestamp getNoPrev() {
		return noPrev;
	}


	public void setNoPrev(Timestamp noPrev) {
		this.noPrev = noPrev;
	}


	private Timestamp calendarStart,calendarEnd;
	
	
	public ExRecord(int memberNo, Timestamp calendarStart, Timestamp calendarEnd) {
		super();
		this.memberNo = memberNo;
		this.calendarStart = calendarStart;
		this.calendarEnd = calendarEnd;
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


	public ExRecord(int memberNo, Timestamp startTime) {
		super();
		this.memberNo = memberNo;
		this.startTime = startTime;
	}


	public int getKcal() {
		return kcal;
	}


	public void setKcal(int kcal) {
		this.kcal = kcal;
	}


	public int getHighBpm() {
		return highBpm;
	}


	public void setHighBpm(int highBpm) {
		this.highBpm = highBpm;
	}


	public int getTotalWeight() {
		return totalWeight;
	}


	public void setTotalWeight(int totalWeight) {
		this.totalWeight = totalWeight;
	}


	public int getHeaviest() {
		return heaviest;
	}


	public void setHeaviest(int heaviest) {
		this.heaviest = heaviest;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public int getBmm() {
		return bmm;
	}


	public void setBmm(int bmm) {
		this.bmm = bmm;
	}


	public int getFatMass() {
		return fatMass;
	}


	public void setFatMass(int fatMass) {
		this.fatMass = fatMass;
	}


	public int getFatRate() {
		return fatRate;
	}


	public void setFatRate(int fatRate) {
		this.fatRate = fatRate;
	}


	public int getcLNo() {
		return cLNo;
	}


	public void setcLNo(int cLNo) {
		this.cLNo = cLNo;
	}


	public int getExNo() {
		return exNo;
	}


	public void setExNo(int exNo) {
		this.exNo = exNo;
	}


	public long getNo() {
		return no;
	}


	public void setNo(long no) {
		this.no = no;
	}


	public double getBmiBefore() {
		return bmiBefore;
	}


	public void setBmiBefore(double bmiBefore) {
		this.bmiBefore = bmiBefore;
	}


	public double getBmiAfter() {
		return bmiAfter;
	}


	public void setBmiAfter(double bmiAfter) {
		this.bmiAfter = bmiAfter;
	}


	public double getAvgBpm() {
		return avgBpm;
	}


	public void setAvgBpm(double avgBpm) {
		this.avgBpm = avgBpm;
	}


	public double getWeight() {
		return weight;
	}


	public void setWeight(double weight) {
		this.weight = weight;
	}


	public double getMuscleBone() {
		return muscleBone;
	}


	public void setMuscleBone(double muscleBone) {
		this.muscleBone = muscleBone;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public Timestamp getStartTime() {
		return startTime;
	}


	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}


	public Timestamp getEndTime() {
		return endTime;
	}


	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}


	public ExRecord() {
		// TODO Auto-generated constructor stub
	}
}
