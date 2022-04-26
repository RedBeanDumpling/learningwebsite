package com.bean;

import java.io.Serializable;
import java.util.*;
//试题主表
public class Paper implements Serializable {
	private int id;
	private String uuid;
	private int kcid;
	private int teacherid;
	private String title;
	private int testtime;//试卷答题时间    分钟
	
	private int score;//总分
	
	private String delstatus;
	
	
	private Kechen kechen;
	private Member teacher;
	private List<Paperdetail> detailList1;//单选集合
	private List<Paperdetail> detailList2;//多选集合
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getTesttime() {
		return testtime;
	}
	public void setTesttime(int testtime) {
		this.testtime = testtime;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
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
	public List<Paperdetail> getDetailList1() {
		return detailList1;
	}
	public void setDetailList1(List<Paperdetail> detailList1) {
		this.detailList1 = detailList1;
	}
	public List<Paperdetail> getDetailList2() {
		return detailList2;
	}
	public void setDetailList2(List<Paperdetail> detailList2) {
		this.detailList2 = detailList2;
	}
	
	
	
}
