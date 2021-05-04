package com.joa.sht.gym_zip.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Event {
	
	private String title;
	private Timestamp startTime;
	private String className, okToggle;
	
	public String getOkToggle() {
		return okToggle;
	}

	public void setOkToggle(String okToggle) {
		this.okToggle = okToggle;
	}

	public Event() {
		// TODO Auto-generated constructor stub
	}

	public Event(String title, Timestamp startTime, String className) {
		this.title = title;
		this.startTime = startTime;
		this.className = className;
		
	}
	
	public Event(String title, Timestamp startTime, String className, String okToggle) {
		this.title = title;
		this.startTime = startTime;
		this.className = className;
		this.okToggle = okToggle;
		
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart() {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		return sdf.format(startTime);
	}
	
	@JsonIgnore
	public Timestamp getStartTime() {
		return startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}
	

}
