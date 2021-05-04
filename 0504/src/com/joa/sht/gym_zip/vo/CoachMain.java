package com.joa.sht.gym_zip.vo;
// 메인 페이지 코치 추천 리스트 
// 0116 오승주 작성 
// 메인 코치 추천에서 코치의 번호와 닉네임, 사진을 얻기위해 사용된다. 
public class CoachMain {

	private int no;
	private String nickname,profile;
	
	public CoachMain() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
}
