package com.bean;

import java.io.Serializable;
import java.util.*;

public class Pinlun implements Serializable {
	private int id;
	
	private String memberid;
	private String kechenid;
	private String content;
	private String savetime;
	private String hfcontent;
	
	private Member member;
	private Kechen kechen;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getKechenid() {
		return kechenid;
	}
	public void setKechenid(String kechenid) {
		this.kechenid = kechenid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Kechen getKechen() {
		return kechen;
	}
	public void setKechen(Kechen kechen) {
		this.kechen = kechen;
	}
	public String getHfcontent() {
		return hfcontent;
	}
	public void setHfcontent(String hfcontent) {
		this.hfcontent = hfcontent;
	}
	
	
	
}
