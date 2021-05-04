package com.joa.sht.gym_zip.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Member {
	
	//NO	MY_ENERGY	PROFILE_IMG	NICKNAME	EMAIL	PASSWORD	GENDER	BIRTHDATE	BM_NO	MEMBER_TIER_NO	REGDATE	HEIGHT	WEIGHT	KCAL_TOTAL	

	private int no,myEnergy,bmNo,memberTierNo,kcalTotal;
	private String profileImg,nickname,email,password,gender,name;
	private double height,weight;
	private Date birthDate;
	private Timestamp regdate;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Member(String nickname, String email, String password, String gender, double height, double weight,
			Date birthDate) {
		
		this.nickname = nickname;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.height = height;
		this.weight = weight;
		this.birthDate = birthDate;
	}

	public Member(String email, String password) {
		this.email = email;
		this.password = password;
	}
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMyEnergy() {
		return myEnergy;
	}

	public void setMyEnergy(int myEnergy) {
		this.myEnergy = myEnergy;
	}

	public int getBmNo() {
		return bmNo;
	}

	public void setBmNo(int bmNo) {
		this.bmNo = bmNo;
	}

	public int getMemberTierNo() {
		return memberTierNo;
	}

	public void setMemberTierNo(int memberTierNo) {
		this.memberTierNo = memberTierNo;
	}

	public int getKcalTotal() {
		return kcalTotal;
	}

	public void setKcalTotal(int kcalTotal) {
		this.kcalTotal = kcalTotal;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
