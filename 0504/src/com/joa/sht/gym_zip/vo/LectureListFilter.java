package com.joa.sht.gym_zip.vo;
// 0125 강의 리스트 출력하기 
public class LectureListFilter {
	// 정렬 기준 
	private String sort;
	
	// 난이도 
	private boolean bigginer;
	private boolean intermediate;
	private boolean advanced;
	
	// 성별 
	private boolean male;
	private boolean female;
	private boolean middle;
	
	// 페이징
	private int start,end;
	
	// 시간 필터 기준
	private int timeRangeStart,timeRangeEnd;
	
	
	
	// 생성자 ========================================
	public LectureListFilter() {
		// TODO Auto-generated constructor stub
	}
	public LectureListFilter(int pageNo,int numPage) {
		// TODO Auto-generated constructor stub
		end = pageNo * numPage;
		start = end-numPage+1;
	}
	// ================================================

	
	
	
	
	

	public int getTimeRangeStart() {
		return timeRangeStart;
	}
	
	public void setTimeRangeStart(int timeRangeStart) {
		this.timeRangeStart = timeRangeStart;
	}
	
	public int getTimeRangeEnd() {
		return timeRangeEnd;
	}
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public void setTimeRangeEnd(int timeRangeEnd) {
		this.timeRangeEnd = timeRangeEnd;
	}
	

	public String getSort() {
		return sort;
	}


	public void setSort(String sort) {
		this.sort = sort;
	}


	public boolean isBigginer() {
		return bigginer;
	}


	public void setBigginer(boolean bigginer) {
		this.bigginer = bigginer;
	}


	public boolean isIntermediate() {
		return intermediate;
	}


	public void setIntermediate(boolean intermediate) {
		this.intermediate = intermediate;
	}


	public boolean isAdvanced() {
		return advanced;
	}


	public void setAdvanced(boolean advanced) {
		this.advanced = advanced;
	}


	public boolean isMale() {
		return male;
	}


	public void setMale(boolean male) {
		this.male = male;
	}


	public boolean isFemale() {
		return female;
	}


	public void setFemale(boolean female) {
		this.female = female;
	}


	public boolean isMiddle() {
		return middle;
	}


	public void setMiddle(boolean middle) {
		this.middle = middle;
	}
	
	
	
	
}
