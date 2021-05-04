package com.joa.sht.gym_zip.vo;

public class ReExerciseFilter {
	private String sort;
	private String level;
	private boolean back;
	private boolean chest;
	private boolean bottom;
	private boolean sholder;
	private boolean arms;
	private boolean stomach;
	private boolean body;
	
	private int pageNo;
	private int pageStart;
	private int pageEnd;
	
	
	public ReExerciseFilter(int pageNo, int numPage) {
		pageEnd = pageNo * numPage;
		pageStart = pageEnd-numPage+1;
		this.pageNo=pageNo;
	}
	
	public ReExerciseFilter(int pageNo, int pageStart, int pageEnd) {
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

	
	
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public boolean isBack() {
		return back;
	}
	public void setBack(boolean back) {
		this.back = back;
	}
	public boolean isChest() {
		return chest;
	}
	public void setChest(boolean chest) {
		this.chest = chest;
	}
	public boolean isBottom() {
		return bottom;
	}
	public void setBottom(boolean bottom) {
		this.bottom = bottom;
	}
	public boolean isSholder() {
		return sholder;
	}
	public void setSholder(boolean sholder) {
		this.sholder = sholder;
	}
	public boolean isArms() {
		return arms;
	}
	public void setArms(boolean arms) {
		this.arms = arms;
	}
	public boolean isStomach() {
		return stomach;
	}
	public void setStomach(boolean stomach) {
		this.stomach = stomach;
	}
	public boolean isBody() {
		return body;
	}
	public void setBody(boolean body) {
		this.body = body;
	}
	public ReExerciseFilter() {
		// TODO Auto-generated constructor stub
	}
	
}
