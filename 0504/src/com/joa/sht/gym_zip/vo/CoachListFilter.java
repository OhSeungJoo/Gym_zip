package com.joa.sht.gym_zip.vo;

import java.util.List;
import java.util.Map;

public class CoachListFilter {
	private String sort,onOff;
	
	private String[] days;
	
	private List<Map<String,Integer>> times;
	
	//0123 박해원 코치리스트 페이징을 위한 멤버필드 
	private int pageNo,pageStart,pageEnd;
	
	public CoachListFilter() {
		// TODO Auto-generated constructor stub
	}
	
	public CoachListFilter(int pageNo,int numPage) {
		
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

	public String[] getDays() {
		return days;
	}

	public void setDays(String[] days) {
		this.days = days;
	}

	public List<Map<String, Integer>> getTimes() {
		return times;
	}

	public void setTimes(List<Map<String, Integer>> times) {
		this.times = times;
	}

	public String getOnOff() {
		return onOff;
	}

	public void setOnOff(String onOff) {
		this.onOff = onOff;
	}

	
	
	// 0123 박해원
	//코치리스트 페이징 처리를 위한 getter,setter
	
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
