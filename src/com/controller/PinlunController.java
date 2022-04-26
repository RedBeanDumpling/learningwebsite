package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import com.bean.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Info;
import com.dao.BaomingDAO;
import com.dao.KechenDAO;
import com.dao.MemberDAO;
import com.dao.PinlunDAO;

import java.util.*;

@Controller
public class PinlunController{
	@Resource
	MemberDAO memberDAO;
	@Resource
	PinlunDAO pinlunDAO;
	@Resource
	KechenDAO kechenDAO;
	
	@Resource
	BaomingDAO baomingDAO;
	
	//评论添加
	@RequestMapping("pinlunAdd")
	public String pinlunAdd(Pinlun pinlun, HttpServletRequest request,RedirectAttributes redirectAttributes){
		Member member  = (Member)request.getSession().getAttribute("sessionmember");
		Member mmm = memberDAO.findById(member.getId());
		HashMap map = new HashMap();
		map.put("memberid", member.getId());
		map.put("kechenid", pinlun.getKechenid());
		if(mmm.getUtype().equals("学生")){
		List<Baoming> bmlist = baomingDAO.selectAll(map);
		if(bmlist.size()!=0){
		List<Pinlun> list = pinlunDAO.selectAll(map);
		if(list.size()==0){
		Kechen kechen = kechenDAO.findById(Integer.parseInt(pinlun.getKechenid()));
		pinlun.setMemberid(String.valueOf(member.getId()));
		pinlun.setSavetime(Info.getDateStr());
		pinlunDAO.add(pinlun);
		redirectAttributes.addFlashAttribute("message","评论成功");
		}else{
			redirectAttributes.addFlashAttribute("message","不能重复操作");
		}
		}else{
			redirectAttributes.addFlashAttribute("message","请先报名");
		}
		}else{
			redirectAttributes.addFlashAttribute("message","请先注册学生帐号");
		}
		return "redirect:kechenDetails.do?id="+pinlun.getKechenid();
	}
	
	
	
	//后台评论列表
    @RequestMapping("admin/pinlunList")
    public String pinlunList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        Sysuser teacher = (Sysuser)request.getSession().getAttribute("admin");
	    String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
        map.put("tid", teacher.getId());
        List<Pinlun> list = pinlunDAO.selectAll(map);
        for(Pinlun pinlun:list){
            Member member = memberDAO.findById(Integer.parseInt(pinlun.getMemberid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(pinlun.getKechenid()));
            pinlun.setMember(member);
            pinlun.setKechen(kechen);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Pinlun> objectlist = pinlunDAO.selectAll(map);
        for(Pinlun pinlun:objectlist){
            Member member = memberDAO.findById(Integer.parseInt(pinlun.getMemberid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(pinlun.getKechenid()));
            pinlun.setMember(member);
            pinlun.setKechen(kechen);
        }
        PageInfo<Pinlun> pageInfo = new PageInfo<Pinlun>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("key", key);
        return "admin/pinlunlist";
    }
	
	
	//评论删除
	@RequestMapping("admin/pinlunDel")
	public String pinlunDel(int id,HttpServletRequest request){
			pinlunDAO.delete(id);
		return "redirect:pinlunList.do";
	}
	
	//评论回复页面
	@RequestMapping("admin/pinlunShow")
	public String pinlunShow(int id,HttpServletRequest request){
		Pinlun pinlun = pinlunDAO.findById(id);
		request.setAttribute("pinlun", pinlun);
		return "admin/pinlunhf";
	}
	
	//评论回复
	@RequestMapping("admin/pinlunEdit")
	public String pinlunEdit(Pinlun pinlun,HttpServletRequest request){
		pinlunDAO.update(pinlun);
		return "redirect:pinlunList.do";
	}
	
	
	
	

}
