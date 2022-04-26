package com.bean;

import java.io.Serializable;
import java.util.*;

public class Baoming implements Serializable {
	private int id;
	private String stid;
	private String kcid;
	private String savetime;
	
	private Member student;
	private Kechen kechen;
	
	
	
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public Member getStudent() {
		return student;
	}
	public void setStudent(Member student) {
		this.student = student;
	}
	public Kechen getKechen() {
		return kechen;
	}
	public void setKechen(Kechen kechen) {
		this.kechen = kechen;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStid() {
		return stid;
	}
	public void setStid(String stid) {
		this.stid = stid;
	}
	public String getKcid() {
		return kcid;
	}
	public void setKcid(String kcid) {
		this.kcid = kcid;
	}
	
	
	
	
	
	
}
