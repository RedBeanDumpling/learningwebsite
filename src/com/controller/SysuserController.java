package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;




import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.MD5;


import com.dao.SysuserDAO;
import com.bean.Sysuser;

import java.util.*;

@Controller
public class SysuserController{
	@Resource
	SysuserDAO sysuserDAO;
	
	//后台登录
	@RequestMapping("admin/login")
	public String login(Sysuser user ,HttpServletRequest request) {
			//user.setUserpassword(user.getUserpassword());
		    List<Sysuser> list = sysuserDAO.selectOne(user);
		    if(list.size()==0){
		    	request.setAttribute("error", "用户名或密码错误");
		    	return "admin/login";
		    }else{
		    	request.getSession().setAttribute("admin", list.get(0));
		    	return "admin/index";
		    }

	}


	//更新管理员信息
	@RequestMapping("admin/update")
	public String update(Sysuser user, HttpServletRequest request) {
		sysuserDAO.update(user);
		return "redirect:show.do?msg=msg";
	}
	
	
	@RequestMapping("admin/updatepwd")
	public String updatepwd(int id,String userpassword, HttpServletRequest request) {
		String oldpassword = request.getParameter("oldpassword") ;
		Sysuser user = sysuserDAO.findById(id);
//		System.out.println("flag===="+oldpassword);
//		System.out.println("flag===="+user.getUserpassword());
//		System.out.println("flag===="+oldpassword.equals(user.getUserpassword()));
		if(oldpassword.equals(user.getUserpassword())){
			sysuserDAO.updatepwd(id,userpassword);
			request.setAttribute("suc", "操作成功");
		}else{
			request.setAttribute("error", "原密码错误");
		}
		return "admin/updatepwd";
	}

	
	//编辑页面
	@RequestMapping("admin/show")
	public String showid(HttpServletRequest request) {
		String msg = request.getParameter("msg");
		Sysuser user =  (Sysuser)request.getSession().getAttribute("admin");
		Sysuser admin = sysuserDAO.findById(user.getId());
		request.setAttribute("user", admin);
		if(msg!=null){
		request.setAttribute("suc", "编辑成功");
		}
		return "admin/admininfo";
	}
	
	
	//检查用户名的唯一性
	@RequestMapping("admin/checkUsername")
	public void checkUsername(String username, HttpServletRequest request, HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			List<Sysuser> list = sysuserDAO.checkUsername(username);
			if(list.size()==0){
				out.print(0);
			}else{
				out.print(1);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	//用户名的唯一性
	@RequestMapping("/admin/usernameCheck")
	public String usernameCheck(String username, HttpServletRequest request,HttpServletResponse response){
   	 try {
			PrintWriter out =  response.getWriter();
			List<Sysuser> list = sysuserDAO.usernamecheck(username);
	    	 if(list.size()==0){
	    		 out.write("0");
	    	 }else{
	    		 out.write("1");
	    	 }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   	 return null;
    }
	
	
	
	@RequestMapping("admin/userShow")
	public String userShow(int id,HttpServletRequest request) {
		Sysuser user = sysuserDAO.findById(id);
		request.setAttribute("user", user);
		return "admin/useredit";
	}
	
	
	
	

}
