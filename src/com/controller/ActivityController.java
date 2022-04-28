package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import com.sun.xml.internal.bind.v2.TODO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Info;
import com.bean.Activity;
import com.bean.Member;
import com.bean.Sysuser;
import com.dao.ActivityDAO;

import java.util.*;

@Controller
public class ActivityController{
	@Resource
	ActivityDAO activityDAO;
	
	
	
	//后台公告列表
    @RequestMapping("admin/activityList")
    public String activityList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
        List<Activity> list = activityDAO.selectAll(map);
        PageHelper.startPage(pageNum, pageSize);
        List<Activity> objectlist = activityDAO.selectAll(map);
        PageInfo<Activity> pageInfo = new PageInfo<Activity>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("key", key);
        return "admin/activitylist";
    }
	
	//前台公告列表
    @RequestMapping("activityLb")
    public String activityLb(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
        List<Activity> list = activityDAO.selectAll(map);
        for(Activity activity:list){
            String content = Info.delHTMLTag(activity.getContent());
            activity.setContent(content);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Activity> objectlist = activityDAO.selectAll(map);
        for(Activity activity:objectlist){
            String content = Info.delHTMLTag(activity.getContent());
            activity.setContent(content);
        }
        PageInfo<Activity> pageInfo = new PageInfo<Activity>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("key", key);
        return "activitylb";
    }
	
	
	//公告添加
	@RequestMapping("admin/activityAdd")
	public String teahcerAdd(Activity activity,HttpServletRequest request) {
		activity.setSavetime(Info.getDateStr());
		activityDAO.add(activity);
		return "redirect:activityList.do";
	}
	
	
	//编辑页面
	@RequestMapping("admin/activityShow")
	public String activityShow(int id,HttpServletRequest request) {
		Activity activity = activityDAO.findById(id);
		request.setAttribute("activity", activity);
		return "admin/activityedit";
	}
	
	
	//公告编辑
	@RequestMapping("admin/activityEdit")
	public String activityEdit(Activity activity,HttpServletRequest request) {
		activityDAO.update(activity);
		return "redirect:activityList.do";
	}
	
	//公告删除
	@RequestMapping("admin/activityDel")
	public String activityDel(int id,HttpServletRequest request) {
		activityDAO.delete(id);
		return "redirect:activityList.do";
	}
	
	//公告信息详情页面
	@RequestMapping("activityx")
	public String activityx(int id,HttpServletRequest request) {
        //根据传来的信息进行查询
        //TODO
		Activity activity = activityDAO.findById(id);
		request.setAttribute("activity", activity);
		return "activity";

	}
	

}
