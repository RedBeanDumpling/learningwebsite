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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Info;
import com.bean.Activity;
import com.bean.Baoming;
import com.bean.Kechen;
import com.bean.Member;
import com.bean.Sysuser;
import com.dao.ActivityDAO;
import com.dao.BaomingDAO;
import com.dao.KechenDAO;
import com.dao.MemberDAO;

import java.util.*;

@Controller
public class BaomingController{
	@Resource
	BaomingDAO baomingDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	KechenDAO kechenDAO;
	
	
	
	//后台报名列表
    @RequestMapping("admin/baomingList")
    public String baomingList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
        List<Baoming> list = baomingDAO.selectAll(map);
        for(Baoming baoming:list){
            Member student = memberDAO.findById(Integer.parseInt(baoming.getStid()));
            baoming.setStudent(student);
            Kechen kechen = kechenDAO.findById(Integer.parseInt(baoming.getKcid()));
            baoming.setKechen(kechen);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Baoming> objectlist = baomingDAO.selectAll(map);
        for(Baoming baoming:objectlist){
            Member student = memberDAO.findById(Integer.parseInt(baoming.getStid()));
            baoming.setStudent(student);
            Kechen kechen = kechenDAO.findById(Integer.parseInt(baoming.getKcid()));
            baoming.setKechen(kechen);
        }
        PageInfo<Baoming> pageInfo = new PageInfo<Baoming>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("key", key);
        return "admin/baominglist";
    }
	
	//前台报名列表
    @RequestMapping("baomingLb")
    public String baomingLb(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        Member member = (Member)request.getSession().getAttribute("sessionmember");
        HashMap map = new HashMap();
        map.put("stid", member.getId());
        List<Baoming> list = baomingDAO.selectAll(map);
        for(Baoming baoming:list){
            Kechen kechen = kechenDAO.findById(Integer.parseInt(baoming.getKcid()));
            baoming.setKechen(kechen);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Baoming> objectlist = baomingDAO.selectAll(map);
        for(Baoming baoming:objectlist){
            Kechen kechen = kechenDAO.findById(Integer.parseInt(baoming.getKcid()));
            baoming.setKechen(kechen);
        }
        PageInfo<Baoming> pageInfo = new PageInfo<Baoming>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        return "baominglb";
    }
	
	//报名添加
	@RequestMapping("baomingAdd")
	public String baomingAdd(Baoming baoming,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		if(member.getUtype().equals("学生")){
		HashMap map = new HashMap();
		map.put("stid", member.getId());
		map.put("kcid", baoming.getKcid());
		List<Baoming> list = baomingDAO.selectAll(map);
		if(list.size()==0){
		baoming.setStid(String.valueOf(member.getId()));
		baoming.setSavetime(Info.getDateStr());
		baomingDAO.add(baoming);
		redirectAttributes.addFlashAttribute("msg","报名成功");
		return "redirect:kechenDetails.do?id="+baoming.getKcid();
		}else{
		redirectAttributes.addFlashAttribute("msg","已经报过名了");
		return "redirect:kechenDetails.do?id="+baoming.getKcid();
		}
		}else{
		redirectAttributes.addFlashAttribute("msg","请先注册学生帐号");
		return "redirect:kechenDetails.do?id="+baoming.getKcid();	
		}
	}
	
	
	
	
	//报名删除
	@RequestMapping("admin/baomingDel")
	public String baomingDel(int id,HttpServletRequest request) {
		baomingDAO.delete(id);
		return "redirect:baomingList.do";
	}
	
	//报名删除
	@RequestMapping("baomingSc")
	public String baomingSc(int id,HttpServletRequest request) {
		baomingDAO.delete(id);
		return "redirect:baomingLb.do";
	}
	
	
	

}
