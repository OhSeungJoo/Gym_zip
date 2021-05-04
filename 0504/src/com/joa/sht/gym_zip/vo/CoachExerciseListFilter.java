package com.joa.sht.gym_zip.vo;

public class CoachExerciseListFilter {

	private String sort;
	private int coachNo,pageNo,pageStart,pageEnd;
	
	public CoachExerciseListFilter() {
		// TODO Auto-generated constructor stub
	}
	
	public CoachExerciseListFilter(int pageNo,int numPage) {
		
		pageEnd= pageNo*numPage;
		pageStart = pageEnd-numPage+1;
		this.pageNo=pageNo;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getCoachNo() {
		return coachNo;
	}

	public void setCoachNo(int coachNo) {
		this.coachNo = coachNo;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageStart() {
		return pageStart;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
	
	
	
}
