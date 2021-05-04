package com.joa.sht.gym_zip.vo;

// 강의 결제를 위한 VO
// 0122 오승주 
public class LecturePayment {
	private int memberNo,coachNo, lectureNo, period, cost, lectureStdNo; 
	// 수강생 번호, 강사 번호, 강의 번호, 강의 기간, 요금, 강의 수강 번호 
	
	// 기본 생성자 
	public LecturePayment() {
		// TODO Auto-generated constructor stub
	}

	
	// 모든 필드를 활용한 생성자 
	public LecturePayment(int memberNo, int coachNo, int lectureNo, int period, int cost, int lectureStdNo) {
		super();
		this.memberNo = memberNo;
		this.coachNo = coachNo;
		this.lectureNo = lectureNo;
		this.period = period;
		this.cost = cost;
		this.lectureStdNo = lectureStdNo;
	}

	// 강의 목록 번호 제외 생성자 
	public LecturePayment(int memberNo, int coachNo, int lectureNo, int period, int cost) {
		super();
		this.memberNo = memberNo;
		this.coachNo = coachNo;
		this.lectureNo = lectureNo;
		this.period = period;
		this.cost = cost;
	}





	// Getter and Setter 
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

	public int getLectureNo() {
		return lectureNo;
	}

	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getLectureStdNo() {
		return lectureStdNo;
	}

	public void setLectureStdNo(int lectureStdNo) {
		this.lectureStdNo = lectureStdNo;
	}
	
	
	
}
