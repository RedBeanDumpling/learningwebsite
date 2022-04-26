package com.controller;

import org.springframework.stereotype.Component;

import com.bean.Baoming;
import com.bean.Category;
import com.bean.Member;

import com.dao.BaomingDAO;
import com.dao.CategoryDAO;
import com.dao.MemberDAO;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Component
public class Saveobject {
	@Resource 
	CategoryDAO categoryDAO;
	@Resource 
	BaomingDAO baomingDAO;
	
	
	
     public void getCategoryObject(HttpServletRequest request){
    	 List<Category> ctlist = categoryDAO.selectAll(null);
    	 request.setAttribute("ctlist", ctlist);
     }
     
	public String isBm(String kcid, HttpServletRequest request) {
		String str = "";
		Member member = (Member) request.getSession().getAttribute("sessionmember");
		HashMap map = new HashMap();
		map.put("kcid", kcid);
		map.put("stid", member.getId());
		List<Baoming> bmlist = baomingDAO.selectAll(map);
		if(bmlist.size()>0){
			str = "yes";
		}else{
			str="no";
		}
		System.out.println("str==="+str);
		return str;
	}
}
