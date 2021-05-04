package com.joa.sht.gym_zip.vo;

import java.sql.Timestamp;

public class RepresentExercise {

	private int no,kcal,partNo; // 기본키 번호, 칼로리, 운동부위 번호
	private long viewCount; // 조회수
	private String title; // 제목
	private Timestamp regdate;
	private String levels;//필요에 의해 테이블엔 없지만 추가한 맴버필드
	private String thumbnail;//필요에 의해 테이블엔 없지만 추가한 맴버필드
	private String partName;//필요에 의해 테이블엔 없지만 추가한 맴버필드
	
	
	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getLevels() {
		return levels;
	}

	public void setLevels(String levels) {
		this.levels = levels;
	}

	

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public int getPartNo() {
		return partNo;
	}

	public void setPartNo(int partNo) {
		this.partNo = partNo;
	}

	public long getViewCount() {
		return viewCount;
	}

	public void setViewCount(long viewCount) {
		this.viewCount = viewCount;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public RepresentExercise() {
		// TODO Auto-generated constructor stub
	}
}
