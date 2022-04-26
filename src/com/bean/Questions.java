package com.bean;

import java.io.Serializable;
import java.util.*;
//题目
public class Questions implements Serializable {
	private int id;
	private String uuid;
	private String title;
	private String answer;
	private String type;
	private int kcid;
	private int teacherid;
	private String delstatus;
	private int score;
	
	private Kechen kechen;
	private Member teacher;
	private List<Answers> answerslist;
	
	
	private String myanswer;//临时存储考生的答案
	private String zql;//正确率
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public int getKcid() {
		return kcid;
	}
	public void setKcid(int kcid) {
		this.kcid = kcid;
	}
	public int getTeacherid() {
		return teacherid;
	}
	public void setTeacherid(int teacherid) {
		this.teacherid = teacherid;
	}
	public List<Answers> getAnswerslist() {
		return answerslist;
	}
	public void setAnswerslist(List<Answers> answerslist) {
		this.answerslist = answerslist;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	public Kechen getKechen() {
		return kechen;
	}
	public void setKechen(Kechen kechen) {
		this.kechen = kechen;
	}
	public Member getTeacher() {
		return teacher;
	}
	public void setTeacher(Member teacher) {
		this.teacher = teacher;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getMyanswer() {
		return myanswer;
	}
	public void setMyanswer(String myanswer) {
		this.myanswer = myanswer;
	}
	public String getZql() {
		return zql;
	}
	public void setZql(String zql) {
		this.zql = zql;
	}
	
	
	
	
}
