package com.joa.sht.gym_zip.vo;

public class Step {
	private int no;
	private int step;
	private int pageNo;
	private int pageStart;
	private int pageEnd;
	
	
	public Step(int pageNo, int numPage) {
		pageEnd = pageNo * numPage;
		pageStart = pageEnd-numPage+1;
		this.pageNo=pageNo;
	}
	
	public Step(int pageNo, int pageStart, int pageEnd) {
		this.pageNo = pageNo;
		this.pageStart = pageStart;
		this.pageEnd = pageEnd;
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
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public Step() {
		// TODO Auto-generated constructor stub
	}
	
}
