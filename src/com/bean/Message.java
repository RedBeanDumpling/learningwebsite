package com.bean;

import java.io.Serializable;
import java.util.*;

public class Message implements Serializable {
	private int id;
	private String memberid;
	private String content;
	private String savetime;
	private String hfcontent;
	private String hfsavetime;
	
	private Member member;

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

	public String getHfcontent() {
		return hfcontent;
	}

	public void setHfcontent(String hfcontent) {
		this.hfcontent = hfcontent;
	}

	public String getHfsavetime() {
		return hfsavetime;
	}

	public void setHfsavetime(String hfsavetime) {
		this.hfsavetime = hfsavetime;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	
	
}
