package com.bean;

import java.io.Serializable;
import java.util.*;
//考试记录主表
public class Exam implements Serializable {
	private int id;
	private String uuid;
	private int paperid;
	private int stuid;
	private int score;
	private String savetime;
	
	private Paper paper;
	private Member student;
	
	private List<Examdetail> examdetailList;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public int getPaperid() {
		return paperid;
	}
	public void setPaperid(int paperid) {
		this.paperid = paperid;
	}
	public int getStuid() {
		return stuid;
	}
	public void setStuid(int stuid) {
		this.stuid = stuid;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public Paper getPaper() {
		return paper;
	}
	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	public List<Examdetail> getExamdetailList() {
		return examdetailList;
	}
	public void setExamdetailList(List<Examdetail> examdetailList) {
		this.examdetailList = examdetailList;
	}
	public Member getStudent() {
		return student;
	}
	public void setStudent(Member student) {
		this.student = student;
	}
	
	
}
