package com.joa.sht.gym_zip.vo;

import java.sql.Timestamp;

public class LectureReview {

	//NO	CONTENTS	EFFECT	DELIVERY	PREPARE	KINDNESS	REGDATE	QUALITY	

	private int no;
	private String contents,effect,delivery,prepare,kindness,quality;
	private Timestamp regdate;


	// 필드 추가 0117 오승주
	//TOTALNUM	AVGEFFECT	AVGDELIVERY	AVGPREPARE	AVGKINDNESS	AVGQUALITY	
	private int totalNum;
	private Double avgEffect,avgDelivery,avgPrepare,avgKindness,avgQuality;


	//기본 생성자
	public LectureReview() {
		// TODO Auto-generated constructor stub
	}
	//조용규
	public LectureReview(int no, String contents, String effect, String delivery, String prepare, String kindness,
			String quality) {
		super();
		this.no = no;
		this.contents = contents;
		this.effect = effect;
		this.delivery = delivery;
		this.prepare = prepare;
		this.kindness = kindness;
		this.quality = quality;
	}

	//===================================================================================================
	// setter, getter 추가 0117 오승주 
	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public Double getAvgEffect() {
		return avgEffect;
	}

	public void setAvgEffect(Double avgEffect) {
		this.avgEffect = avgEffect;
	}

	public Double getAvgDelivery() {
		return avgDelivery;
	}

	public void setAvgDelivery(Double avgDelivery) {
		this.avgDelivery = avgDelivery;
	}

	public Double getAvgPrepare() {
		return avgPrepare;
	}

	public void setAvgPrepare(Double avgPrepare) {
		this.avgPrepare = avgPrepare;
	}

	public Double getAvgKindness() {
		return avgKindness;
	}

	public void setAvgKindness(Double avgKindness) {
		this.avgKindness = avgKindness;
	}

	public Double getAvgQuality() {
		return avgQuality;
	}

	public void setAvgQuality(Double avgQuality) {
		this.avgQuality = avgQuality;
	}
	//====================================================================================



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getEffect() {
		return effect;
	}

	public void setEffect(String effect) {
		this.effect = effect;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getPrepare() {
		return prepare;
	}

	public void setPrepare(String prepare) {
		this.prepare = prepare;
	}

	public String getKindness() {
		return kindness;
	}

	public void setKindness(String kindness) {
		this.kindness = kindness;
	}

	public String getQuality() {
		return quality;
	}

	public void setQuality(String quality) {
		this.quality = quality;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}



}
