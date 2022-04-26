package com.bean;

import java.io.Serializable;
import java.util.*;

public class Kechen implements Serializable {
	private int id;
	private String kcname;
	private String categoryid;
	private String filename;
	private String content;
	private String istj;
	private String delstatus;
	private int teacherid;
	private Category category;
	
	private Member teacher;
	public String getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(String categoryid) {
		this.categoryid = categoryid;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getKcname() {
		return kcname;
	}
	public void setKcname(String kcname) {
		this.kcname = kcname;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIstj() {
		return istj;
	}
	public void setIstj(String istj) {
		this.istj = istj;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	public int getTeacherid() {
		return teacherid;
	}
	public void setTeacherid(int teacherid) {
		this.teacherid = teacherid;
	}
	public Member getTeacher() {
		return teacher;
	}
	public void setTeacher(Member teacher) {
		this.teacher = teacher;
	}
	
	
	
}
