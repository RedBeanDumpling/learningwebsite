package com.bean;

import java.io.Serializable;
import java.util.*;

public class Zuoye implements Serializable {
	private int id;
	private String stid;
	private String tcid;
	private String kcid;
	private String zyid;
	private String filename;
	private String savetime;

	
	private Member student;
	private Member teacher;
	private Kechen kechen;
	private Kechenlr zy;
	//422add
	private boolean isChecked;



	private int score=0;


	
	
	
	public Member getTeacher() {
		return teacher;
	}
	public void setTeacher(Member teacher) {
		this.teacher = teacher;
	}
	public String getKcid() {
		return kcid;
	}
	public void setKcid(String kcid) {
		this.kcid = kcid;
	}
	public Kechen getKechen() {
		return kechen;
	}
	public void setKechen(Kechen kechen) {
		this.kechen = kechen;
	}
	public Member getStudent() {
		return student;
	}
	public void setStudent(Member student) {
		this.student = student;
	}
	public Kechenlr getZy() {
		return zy;
	}
	public void setZy(Kechenlr zy) {
		this.zy = zy;
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
	public String getTcid() {
		return tcid;
	}
	public void setTcid(String tcid) {
		this.tcid = tcid;
	}
	public String getZyid() {
		return zyid;
	}
	public void setZyid(String zyid) {
		this.zyid = zyid;
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
	//new setter and getter
	public boolean getIsChecked(){return isChecked;}
	public void setIsChecked(boolean isChecked){this.isChecked=isChecked;}
	public int getScore() {return score;}
	public void setScore(int score) {this.score = score;}
	
	
	
}
