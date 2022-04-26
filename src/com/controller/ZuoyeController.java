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
import com.bean.Kechen;
import com.bean.Kechenlr;
import com.bean.Member;
import com.bean.Sysuser;
import com.bean.Zuoye;
import com.dao.ActivityDAO;
import com.dao.KechenDAO;
import com.dao.KechenlrDAO;
import com.dao.MemberDAO;
import com.dao.ZuoyeDAO;

import java.util.*;

@Controller
public class ZuoyeController{
	@Resource
	ZuoyeDAO zuoyeDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	KechenlrDAO kechenlrDAO;
	@Resource
	KechenDAO kechenDAO;
	
	
	
	
	
	
	//后台作业列表
    @RequestMapping(value = {"zuoyeMsg","pigai"})
    public String zuoyeMsg(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        Member member = (Member)request.getSession().getAttribute("sessionmember");
        HashMap map = new HashMap();
        map.put("tcid", member.getId());
        List<Zuoye> list = zuoyeDAO.selectAll(map);
        for(Zuoye zuoye:list){
            Member student = memberDAO.findById(Integer.parseInt(zuoye.getStid()));
            Kechenlr zy = kechenlrDAO.findById(Integer.parseInt(zuoye.getZyid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(zuoye.getKcid()));
            zuoye.setKechen(kechen);
            zuoye.setStudent(student);
            zuoye.setZy(zy);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Zuoye> objectlist = zuoyeDAO.selectAll(map);
        for(Zuoye zuoye:objectlist){
            Member student = memberDAO.findById(Integer.parseInt(zuoye.getStid()));
            Kechenlr zy = kechenlrDAO.findById(Integer.parseInt(zuoye.getZyid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(zuoye.getKcid()));
            zuoye.setKechen(kechen);
            zuoye.setStudent(student);
            zuoye.setZy(zy);
        }
        PageInfo<Zuoye> pageInfo = new PageInfo<Zuoye>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        return "zuoyemsg";
    }


	
	//前台作业列表
    @RequestMapping("zuoyeLb")
    public String zuoyeLb(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        Member member = (Member)request.getSession().getAttribute("sessionmember");
        HashMap map = new HashMap();
        map.put("stid", member.getId());
        List<Zuoye> list = zuoyeDAO.selectAll(map);
        for(Zuoye zuoye:list){
            Kechen kechen = kechenDAO.findById(Integer.parseInt(zuoye.getKcid()));
            zuoye.setKechen(kechen);
            Kechenlr zy = kechenlrDAO.findById(Integer.parseInt(zuoye.getZyid()));
            zuoye.setZy(zy);
            Member teacher = memberDAO.findById(Integer.parseInt(zuoye.getTcid()));
            zuoye.setTeacher(teacher);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Zuoye> objectlist = zuoyeDAO.selectAll(map);
        for(Zuoye zuoye:objectlist){
            Kechen kechen = kechenDAO.findById(Integer.parseInt(zuoye.getKcid()));
            zuoye.setKechen(kechen);
            Kechenlr zy = kechenlrDAO.findById(Integer.parseInt(zuoye.getZyid()));
            zuoye.setZy(zy);
            Member teacher = memberDAO.findById(Integer.parseInt(zuoye.getTcid()));
            zuoye.setTeacher(teacher);
        }
        PageInfo<Zuoye> pageInfo = new PageInfo<Zuoye>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        return "zuoyelb";
    }
	
	//作业添加
	@RequestMapping("zuoyeAdd")
	public String zuoyeAdd(Zuoye zuoye,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		String kcid = request.getParameter("kcid");
		Kechenlr kechenlr = kechenlrDAO.findById(Integer.parseInt(zuoye.getZyid()));
		zuoye.setSavetime(Info.getDateStr());
		zuoye.setStid(String.valueOf(member.getId()));
		zuoye.setTcid(kechenlr.getTcid());
		zuoyeDAO.add(zuoye);
		redirectAttributes.addFlashAttribute("msg","提交成功");
		return "redirect:skipzuoye.do?kcid="+kcid+"&zyid="+zuoye.getZyid();
	}
	
	//跳转
	@RequestMapping("skipzuoye")
	public String skipzuoye(HttpServletRequest request,RedirectAttributes redirectAttributes) {
		String zyid = request.getParameter("zyid");
		String kcid = request.getParameter("kcid");
		Kechenlr kechenlr = kechenlrDAO.findById(Integer.parseInt(zyid));
		if(Info.compare_datezq(Info.getDateStr().substring(0,10), kechenlr.getSavetime()).equals("big")){
			redirectAttributes.addFlashAttribute("msg","已超时不能提交");
			return "redirect:kechenDetails.do?id="+kcid;
		}else{
			request.setAttribute("zyid", zyid);
			request.setAttribute("kcid", kcid);
			return "zuoyeadd";
		}
	}
	
	

	//作业删除
	@RequestMapping("zuoyeSc")
	public String zuoyeSc(int id,HttpServletRequest request) {
		zuoyeDAO.delete(id);
		return "redirect:zuoyeLb.do";
	}
	
	
	//作业删除
	@RequestMapping("zuoyeDel")
	public String zuoyeDel(int id,HttpServletRequest request) {
		zuoyeDAO.delete(id);
		return "redirect:zuoyeMsg.do";
	}

    @RequestMapping("pigai")
    public String pigai(HttpServletRequest request){
        return "redirect:pigai.do";
    }

	

}
