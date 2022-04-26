package com.bean;

import java.io.Serializable;
import java.util.*;

public class Kechenlr implements Serializable {
	private int id;
	private String tcid;
	private String kcid;
	private String title;
	private String filename;
	private String content;
	private String savetime;
	private String flag;
	private String delstatus;
	private String shstatus;
    private int cs;
	
	private Kechen kechen;
	private Member teacher;


    public int getCs() {
        return cs;
    }

    public void setCs(int cs) {
        this.cs = cs;
    }

    public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getShstatus() {
		return shstatus;
	}
	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTcid() {
		return tcid;
	}
	public void setTcid(String tcid) {
		this.tcid = tcid;
	}
	public String getKcid() {
		return kcid;
	}
	public void setKcid(String kcid) {
		this.kcid = kcid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
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
	
	
	
	
}
