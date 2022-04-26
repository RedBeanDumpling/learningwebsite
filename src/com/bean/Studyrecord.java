package com.bean;

import java.io.Serializable;
import java.util.*;

public class Studyrecord implements Serializable {
	private int id;
	private int kclrid;
	private int mid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getKclrid() {
		return kclrid;
	}
	public void setKclrid(int kclrid) {
		this.kclrid = kclrid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}

	
	
}
