package com.joa.sht.gym_zip.vo;

public class WhoseExercise {
	private int coachNo;
	private int exercisePart;
	
	public int getCoachNo() {
		return this.coachNo;
	}
	public void setCoachNo(int coachNo) {
		this.coachNo = coachNo;
	}
	public int getExercisePart() {
		return this.exercisePart;
	}
	public void setExercisePart(int exercisePart) {
		this.exercisePart = exercisePart;
	}
	
	public WhoseExercise() {
		// TODO Auto-generated constructor stub
	}
	public WhoseExercise(int coachNo, int exercisePart) {
		this.coachNo = coachNo;
		this.exercisePart = exercisePart;
	}
	
}
