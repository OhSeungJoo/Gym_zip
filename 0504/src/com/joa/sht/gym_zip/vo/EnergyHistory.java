package com.joa.sht.gym_zip.vo;

import java.sql.Timestamp;

public class EnergyHistory {
	private int no ,memenrNo, energy;
	private String type;
	private long typeNo;
	private Timestamp regdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMemenrNo() {
		return memenrNo;
	}
	public void setMemenrNo(int memenrNo) {
		this.memenrNo = memenrNo;
	}
	public int getEnergy() {
		return energy;
	}
	public void setEnergy(int energy) {
		this.energy = energy;
	}
	public long getTypeNo() {
		return typeNo;
	}
	public void setTypeNo(long typeNo) {
		this.typeNo = typeNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public EnergyHistory() {
		// TODO Auto-generated constructor stub
	}

}
