package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import com.bean.Activity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Info;
import com.bean.Member;
import com.bean.Message;
import com.bean.Sysuser;
import com.dao.MemberDAO;
import com.dao.MessageDAO;

import java.util.*;

@Controller
public class MessageController{
	@Resource
	MessageDAO messageDAO;
	@Resource
	MemberDAO memberDAO;




	//后台留言列表
    @RequestMapping("admin/messageList")
    public String messageList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
        List<Message> list = messageDAO.selectAll(map);
        for(Message message:list){
            Member member = memberDAO.findById(Integer.parseInt(message.getMemberid()));
            message.setMember(member);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Message> objectlist = messageDAO.selectAll(map);
        for(Message message:objectlist){
            Member member = memberDAO.findById(Integer.parseInt(message.getMemberid()));
            message.setMember(member);
        }
        PageInfo<Message> pageInfo = new PageInfo<Message>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("key", key);
        return "admin/messagelist";
    }

	//前台留言列表
		@RequestMapping("messageLb")
		public String messageLb(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
			PageHelper.startPage(pageNum,10);
			List<Message> list = messageDAO.selectAll(null);
			for(Message message:list){
				Member member = memberDAO.findById(Integer.parseInt(message.getMemberid()));
				message.setMember(member);
			}
		   	PageInfo<Message> pageInfo = new PageInfo<Message>(list);
			request.setAttribute("pageInfo", pageInfo);
			return "messagelb";
		}
	//  100 10 10   limit 0, 10   limit 10, 10  limit 20, 10

	//留言添加
	@RequestMapping("messageAdd")
	public String messageAdd(Message message,HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		message.setMemberid(String.valueOf(member.getId()));
		message.setSavetime(Info.getDateStr());
		messageDAO.add(message);
		return "redirect:messageLb.do";
	}


	//编辑页面
	@RequestMapping("admin/messageShow")
	public String messageShow(int id,HttpServletRequest request) {
		Message message = messageDAO.findById(id);
		request.setAttribute("message", message);
		return "admin/messageedit";
	}


	//留言编辑
	@RequestMapping("admin/messageEdit")
	public String messageEdit(Message message,HttpServletRequest request) {
		messageDAO.update(message);
		return "redirect:messageList.do";
	}

	//留言删除
	@RequestMapping("admin/messageDel")
	public String messageDel(int id,HttpServletRequest request) {
		messageDAO.delete(id);
		return "redirect:messageList.do";
	}



}
