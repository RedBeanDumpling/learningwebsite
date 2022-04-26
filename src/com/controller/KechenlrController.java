package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Info;
import com.bean.Activity;
import com.bean.Kechen;
import com.bean.Kechenlr;
import com.bean.Member;
import com.bean.Sysuser;
import com.dao.ActivityDAO;
import com.dao.KechenDAO;
import com.dao.KechenlrDAO;
import com.dao.MemberDAO;
import com.dao.StudyrecordDAO;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class KechenlrController{
	@Resource
	KechenlrDAO kechenlrDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	KechenDAO kechenDAO;

	//后台课程视频列表
    @RequestMapping("admin/kcvideoList")
    public String kcvideoList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
        map.put("flag", "课程视频");
        List<Kechenlr> list = kechenlrDAO.selectAll(map);
        for(Kechenlr kechenlr:list){
            Member teacher = memberDAO.findById(Integer.parseInt(kechenlr.getTcid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(kechenlr.getKcid()));
            kechenlr.setTeacher(teacher);
            kechenlr.setKechen(kechen);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Kechenlr> objectlist = kechenlrDAO.selectAll(map);
        for(Kechenlr kechenlr:objectlist){
            Member teacher = memberDAO.findById(Integer.parseInt(kechenlr.getTcid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(kechenlr.getKcid()));
            kechenlr.setTeacher(teacher);
            kechenlr.setKechen(kechen);
        }
        PageInfo<Kechenlr> pageInfo = new PageInfo<Kechenlr>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("key", key);
        return "admin/kcvideolist";
    }




	//前台课程视频列表
    @RequestMapping("kcvideoLb")
    public String kcvideoLb(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        Member member = (Member)request.getSession().getAttribute("sessionmember");
        String kcid = request.getParameter("kcid");
        HashMap map = new HashMap();
        map.put("tcid", member.getId());
        map.put("kcid",  kcid);
        map.put("flag", "课程视频");
        List<Kechenlr> list = kechenlrDAO.selectAll(map);
        for(Kechenlr kechenlr:list){
            Member teacher = memberDAO.findById(Integer.parseInt(kechenlr.getTcid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(kechenlr.getKcid()));
            kechenlr.setTeacher(teacher);
            kechenlr.setKechen(kechen);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Kechenlr> objectlist = kechenlrDAO.selectAll(map);
        for(Kechenlr kechenlr:objectlist){
            Member teacher = memberDAO.findById(Integer.parseInt(kechenlr.getTcid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(kechenlr.getKcid()));
            kechenlr.setTeacher(teacher);
            kechenlr.setKechen(kechen);
        }
        PageInfo<Kechenlr> pageInfo = new PageInfo<Kechenlr>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("kcid", kcid);
        return "kcvideolb";
    }

	//删除视频课程
	@RequestMapping("admin/kcvideoDel")
	public String kcvideoDel(int id,HttpServletRequest request) {
		kechenlrDAO.delete(id);
		return "redirect:kcvideoList.do";
	}
	//删除视频课程
	@RequestMapping("kcvedeoSc")
	public String kcvedeoSc(int id,HttpServletRequest request) {
		Kechenlr kechelr = kechenlrDAO.findById(id);
		String kcid = kechelr.getKcid();
		kechenlrDAO.delete(id);
		return "redirect:kcvideoLb.do?kcid="+kcid;
	}



	//后台课件列表
    @RequestMapping("admin/kcfileList")
    public String kcfileList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
        map.put("flag", "课件");
        List<Kechenlr> list = kechenlrDAO.selectAll(map);
        for(Kechenlr kechenlr:list){
            Member teacher = memberDAO.findById(Integer.parseInt(kechenlr.getTcid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(kechenlr.getKcid()));
            kechenlr.setTeacher(teacher);
            kechenlr.setKechen(kechen);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Kechenlr> objectlist = kechenlrDAO.selectAll(map);
        for(Kechenlr kechenlr:objectlist){
            Member teacher = memberDAO.findById(Integer.parseInt(kechenlr.getTcid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(kechenlr.getKcid()));
            kechenlr.setTeacher(teacher);
            kechenlr.setKechen(kechen);
        }
        PageInfo<Kechenlr> pageInfo = new PageInfo<Kechenlr>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("key", key);
        return "admin/kcfilelist";
    }

	//前台课件列表
    @RequestMapping("kcfileLb")
    public String kcfileLb(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        Member member = (Member)request.getSession().getAttribute("sessionmember");
        String kcid = request.getParameter("kcid");
        HashMap map = new HashMap();
        map.put("tcid", member.getId());
        map.put("flag", "课件");
        map.put("kcid",  kcid);
        List<Kechenlr> list = kechenlrDAO.selectAll(map);
        for(Kechenlr kechenlr:list){
            Member teacher = memberDAO.findById(Integer.parseInt(kechenlr.getTcid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(kechenlr.getKcid()));
            kechenlr.setTeacher(teacher);
            kechenlr.setKechen(kechen);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Kechenlr> objectlist = kechenlrDAO.selectAll(map);
        for(Kechenlr kechenlr:objectlist){
            Member teacher = memberDAO.findById(Integer.parseInt(kechenlr.getTcid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(kechenlr.getKcid()));
            kechenlr.setTeacher(teacher);
            kechenlr.setKechen(kechen);
        }
        PageInfo<Kechenlr> pageInfo = new PageInfo<Kechenlr>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("kcid", kcid);
        return "kcfilelb";
    }

	//删除课件
	@RequestMapping("admin/kcfileDel")
	public String kcfileDel(int id,HttpServletRequest request) {
		kechenlrDAO.delete(id);
		return "redirect:kcfileList.do";
	}
	//删除课件
	@RequestMapping("kcfileSc")
	public String kcfileSc(int id,HttpServletRequest request) {
		Kechenlr kechelr = kechenlrDAO.findById(id);
		String kcid = kechelr.getKcid();
		kechenlrDAO.delete(id);
		return "redirect:kcfileLb.do?kcid="+kcid;
	}


	//后台作业列表
    @RequestMapping("admin/kczuoyeList")
    public String kczuoyeList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
        map.put("flag", "作业");
        List<Kechenlr> list = kechenlrDAO.selectAll(map);
        for(Kechenlr kechenlr:list){
            Member teacher = memberDAO.findById(Integer.parseInt(kechenlr.getTcid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(kechenlr.getKcid()));
            kechenlr.setTeacher(teacher);
            kechenlr.setKechen(kechen);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Kechenlr> objectlist = kechenlrDAO.selectAll(map);
        for(Kechenlr kechenlr:objectlist){
            Member teacher = memberDAO.findById(Integer.parseInt(kechenlr.getTcid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(kechenlr.getKcid()));
            kechenlr.setTeacher(teacher);
            kechenlr.setKechen(kechen);
        }
        PageInfo<Kechenlr> pageInfo = new PageInfo<Kechenlr>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("key", key);
        return "admin/kczuoyelist";
    }

	//前台作业列表
    @RequestMapping("kczuoyeLb")
    public String kczuoyeLb(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        Member member = (Member)request.getSession().getAttribute("sessionmember");
        String kcid = request.getParameter("kcid");
        HashMap map = new HashMap();
        map.put("tcid", member.getId());
        map.put("flag", "作业");
        map.put("kcid",  kcid);
        List<Kechenlr> list = kechenlrDAO.selectAll(map);
        for(Kechenlr kechenlr:list){
            Member teacher = memberDAO.findById(Integer.parseInt(kechenlr.getTcid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(kechenlr.getKcid()));
            kechenlr.setTeacher(teacher);
            kechenlr.setKechen(kechen);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Kechenlr> objectlist = kechenlrDAO.selectAll(map);
        for(Kechenlr kechenlr:objectlist){
            Member teacher = memberDAO.findById(Integer.parseInt(kechenlr.getTcid()));
            Kechen kechen = kechenDAO.findById(Integer.parseInt(kechenlr.getKcid()));
            kechenlr.setTeacher(teacher);
            kechenlr.setKechen(kechen);
        }
        PageInfo<Kechenlr> pageInfo = new PageInfo<Kechenlr>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("kcid", kcid);
        return "kczuoyelb";
    }


	//删除作业
	@RequestMapping("admin/kczuoyeDel")
	public String kczuoyeDel(int id,HttpServletRequest request) {
		Kechenlr kechenlr = kechenlrDAO.findById(id);
		kechenlr.setDelstatus("1");
		kechenlrDAO.update(kechenlr);
		return "redirect:kczuoyeList.do";
	}
	//删除作业
	@RequestMapping("kczuoyeSc")
	public String kczuoyeSc(int id,HttpServletRequest request) {
		Kechenlr kechenlr = kechenlrDAO.findById(id);
		String kcid = kechenlr.getKcid();
		kechenlr.setDelstatus("1");
		kechenlrDAO.update(kechenlr);
		return "redirect:kczuoyeLb.do?kcid="+kcid;
	}

	//课程内容添加
	@RequestMapping("kechenlrAdd")
	public String kechenlrAdd(Kechenlr kechenlr,HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		String flag = kechenlr.getFlag();
		if(!flag.equals("作业")){
			kechenlr.setSavetime(Info.getDateStr());
		}
		kechenlr.setShstatus("待审核");
		kechenlr.setTcid(String.valueOf(member.getId()));
		kechenlrDAO.add(kechenlr);
		if(flag.equals("作业")){
			return "redirect:kczuoyeLb.do?kcid="+kechenlr.getKcid();
		}else if(flag.equals("课件")){
			return "redirect:kcfileLb.do?kcid="+kechenlr.getKcid();
		}else{
			return "redirect:kcvideoLb.do?kcid="+kechenlr.getKcid();
		}
	}


	//编辑页面
	@RequestMapping("admin/kechenlrShow")
	public String kechenlrShow(int id,HttpServletRequest request) {
		Kechenlr kechenlr = kechenlrDAO.findById(id);
		request.setAttribute("kechenlr", kechenlr);
		return "admin/kechenlredit";
	}


	//编辑
	@RequestMapping("kechenlrEdit")
	public String kechenlrEdit(Kechenlr kechenlr,HttpServletRequest request) {
		Kechenlr lr = kechenlrDAO.findById(kechenlr.getId());
		String flag = kechenlr.getFlag();
		kechenlrDAO.update(kechenlr);
		if(flag.equals("作业")){
			return "redirect:kczuoyeLb.do?kcid="+lr.getKcid();
		}else if(flag.equals("课件")){
			return "redirect:kcfileLb.do?kcid="+lr.getKcid();
		}else{
			return "redirect:kcvideoLb.do?kcid="+lr.getKcid();
		}
	}

	//课程内容删除
	@RequestMapping("admin/kechenlrDel")
	public String kechenlrDel(int id,HttpServletRequest request) {
		Kechenlr kechenlr = kechenlrDAO.findById(id);
		kechenlr.setDelstatus("1");
		kechenlrDAO.update(kechenlr);
		String flag = kechenlr.getFlag();
		if(flag.equals("作业")){
			return "redirect:kczuoyeLb.do";
		}else if(flag.equals("课件")){
			return "redirect:kcfileLb.do";
		}else{
			return "redirect:kcvideoLb.do";
		}
	}

	//跳转
	@RequestMapping("skipkechenlr")
	public String skipkechenlr(HttpServletRequest request) {
		String biaoji = request.getParameter("biaoji")==null?"":request.getParameter("biaoji");
		String kcid = request.getParameter("kcid");
		String flag = request.getParameter("flag");
		request.setAttribute("kcid", kcid);
		request.setAttribute("flag", flag);
		if(biaoji.equals("kechenlradd")){
	    return "kechenlradd";
		}else{
			String id = request.getParameter("id");
			Kechenlr kechenlr = kechenlrDAO.findById(Integer.parseInt(id));
			request.setAttribute("kechenlr", kechenlr);
			return "kechenledit";
		}
	}


	//审核
	@RequestMapping("admin/updateLrsh")
	public String updateLrsh(HttpServletRequest request) {
		String biaoji = request.getParameter("biaoji")==null?"":request.getParameter("biaoji");
		String flag = request.getParameter("flag")==null?"":request.getParameter("flag");
		String id = request.getParameter("id");
		Kechenlr kechenlr = kechenlrDAO.findById(Integer.parseInt(id));
		if(flag.equals("tg")){
			kechenlr.setShstatus("通过审核");
		}else{
			kechenlr.setShstatus("已拒绝");
		}
		kechenlrDAO.update(kechenlr);
		if(biaoji.equals("sp")){
			return "redirect:kcvideoList.do";
		}else if(biaoji.equals("kj")){
			return "redirect:kcfileList.do";
		}else{
			return "redirect:kczuoyeList.do";
		}

	}

    /**
     * 点播次数
     */

    @ResponseBody
    @RequestMapping("updatecs")
    public void updatecs(int id,HttpServletRequest request) {
        Kechenlr kechenlr = kechenlrDAO.findById(id);
        kechenlr.setCs(kechenlr.getCs()+1);
        kechenlrDAO.update(kechenlr);
    }

}
