package com.joa.sht.gym_zip.vo;

import java.sql.Timestamp;

public class MemberBedge {

	int no, memberNo,baggeNo; // 번호, 멤버번호, 벳지번호
	String represent; // 대표여부
	Timestamp regdate;
	
	public MemberBedge() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBaggeNo() {
		return baggeNo;
	}

	public void setBaggeNo(int baggeNo) {
		this.baggeNo = baggeNo;
	}

	public String getRepresent() {
		return represent;
	}

	public void setRepresent(String represent) {
		this.represent = represent;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
