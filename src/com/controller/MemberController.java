package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.*;

import com.bean.Activity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.ExcelUtil;
import com.util.Info;
import com.util.MD5;
import com.dao.MemberDAO;
import com.dao.SysuserDAO;
import com.bean.Member;
import com.bean.Sysuser;

import java.util.*;

@Controller
public class MemberController{
	@Resource
	MemberDAO memberDAO;
	
	
	
	
	//退出
		@RequestMapping("memberexit")
		public String memberexit(HttpServletRequest request) {
			request.getSession().removeAttribute("sessionmember");
			return "redirect:index.do";
		}
	
	//登录
		@RequestMapping("Login")
		public String Login(Member member,HttpServletRequest request) {
			HashMap map = new HashMap();
			map.put("uname", member.getUname());
			map.put("upass", member.getUpass());
			map.put("shstatus", "通过");
			List<Member> list = memberDAO.selectAll(map);
			if(list.size()==0){
				request.setAttribute("suc", "用户名或密码错误");
				return "login";
			}else{
				Member mmm = list.get(0);
				request.getSession().setAttribute("sessionmember",mmm);
				return "redirect:index.do";
			}
		}
		
		
		//检查用户名的唯一性
		@RequestMapping("checkUname")
		public void checkUname(String uname, HttpServletRequest request, HttpServletResponse response){
			try {
				PrintWriter out = response.getWriter();
				HashMap map = new HashMap();
				map.put("uname", uname);
				List<Member> list = memberDAO.selectAll(map);
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
	
	
	//后台用户列表
    @RequestMapping("admin/memberList")
    public String memberList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        String key = request.getParameter("key");
        String utype = request.getParameter("utype");

        HashMap map = new HashMap();
        map.put("key", key);
        map.put("utype", utype);
        List<Member> list = memberDAO.selectAll(map);
        PageHelper.startPage(pageNum, pageSize);
        List<Member> objectlist = memberDAO.selectAll(map);
        PageInfo<Member> pageInfo = new PageInfo<Member>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("key", key);
        request.setAttribute("utype", utype);
        return "admin/memberlist";
    }
	
	
	//用户注册
	@RequestMapping("Register")
	public String Register(Member member,HttpServletRequest request) {
		if(member.getUtype().equals("老师")){
			member.setShstatus("待审核");
		}else{
			member.setShstatus("通过");
		}
		memberDAO.add(member);
		request.setAttribute("suc", "注册成功");
		return "register";
	}
	
	//添加用户
	@RequestMapping("admin/memberAdd")
	public String memberAdd(Member member,HttpServletRequest request) {
		memberDAO.add(member);
		return "redirect:memberList.do";
	}
	
	//编辑页面
	@RequestMapping("admin/memberCk")
	public String memberCk(int id,HttpServletRequest request) {
		Member member = memberDAO.findById(id);
		request.setAttribute("member", member);
		return "admin/memberedit";
	}
	
	//编辑用户
	@RequestMapping("admin/memberEdit")
	public String memberEdit(Member member,HttpServletRequest request) {
		memberDAO.update(member);
		return "redirect:memberList.do";
	}
	
	//老师审核 
	@RequestMapping("admin/teaSh")
	public String memberEdit(int id,int flag,HttpServletRequest request) {
		Member member = memberDAO.findById(id);
		if(flag == 1){
			member.setShstatus("通过");
		}else{
			member.setShstatus("拒绝");
		}
		memberDAO.update(member);
		return "redirect:memberList.do";
	}
	
	
	//个人信息页面
	@RequestMapping("memberShow")
	public String memberShow(int id,HttpServletRequest request) {
		String suc = request.getParameter("suc")==null?"":request.getParameter("suc");
		Member member = memberDAO.findById(id);
		request.setAttribute("member", member);
		if(!suc.equals("")){
			request.setAttribute("suc", "编辑成功");
		}
		return "memberxg";
	}
	
	
	//个人信息修改
	@RequestMapping("memberxg")
	public String memberxg(Member member,HttpServletRequest request) {
		memberDAO.update(member);
		return "redirect:memberShow.do?id="+member.getId()+"&suc=suc";
	}
	
	//删除用户
	@RequestMapping("admin/memberDel")
	public String memberDel(int id,HttpServletRequest request) {
		Member member = memberDAO.findById(id);
		member.setDelstatus("1");
		memberDAO.update(member);
		return "redirect:memberList.do";
	}
	
	
	@RequestMapping("admin/ajaxUploadExcel")
	public String ajaxUploadExcelEmp(HttpServletRequest request,
			HttpServletResponse response,RedirectAttributes redirectAttributes) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;    
        
		Sysuser teacher = (Sysuser)request.getSession().getAttribute("admin");
		
        MultipartFile file = multipartRequest.getFile("upfile");  
        if(file.isEmpty()){  
            try {
				throw new Exception("文件不存在！");
			} catch (Exception e) {
				e.printStackTrace();
			}  
        }  
          
        InputStream in =null;  
        try {
			in = file.getInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}  
        
		List<List<Object>> listob = null; 
		try {
			listob = new ExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
		} catch (Exception e) {
			e.printStackTrace();
		}   
		int sucnum = 0;
		int erronum = 0;
		
	    //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出  
        for (int i = 0; i < listob.size(); i++) {  
        	
            List<Object> lo = listob.get(i);  
            
            if(lo != null){
            	
            	HashMap map = new HashMap();
    			map.put("uname", String.valueOf(lo.get(0)));
//    			map.put("tname", String.valueOf(lo.get(1)));
//    			map.put("tel", String.valueOf(lo.get(2)));
//    			map.put("email", String.valueOf(lo.get(3)));
//    			map.put("utype", String.valueOf(lo.get(4)));
    			List<Member> list = memberDAO.selectAll(map);
    			
            	if(list.size()==0){
            	Member vo = new Member(); 
		        vo.setUname(String.valueOf(lo.get(0)));     // 表格的第一列   注意数据格式需要对应实体类属性
		        vo.setUpass("123");
		        vo.setTname(String.valueOf(lo.get(1)));
		        vo.setTel(String.valueOf(lo.get(2)));
		        vo.setEmail(String.valueOf(lo.get(3)));
		        vo.setUtype(String.valueOf(lo.get(4)));
		        vo.setDelstatus("0");
		        //System.out.println("从excel中读取的实体类对象："+ vo);
		        memberDAO.add(vo);
		        sucnum++;
            	}else{
            	erronum++;
            	}
            }
        }
        redirectAttributes.addFlashAttribute("message", "文件导入成功"+sucnum+"条，失败"+erronum+"条!");
        return "redirect:memberList.do";
	}
	
	
	//导出
	@RequestMapping("admin/exportB")
    public void exportB(HttpServletRequest request,HttpServletResponse response) {
		Sysuser teacher = (Sysuser)request.getSession().getAttribute("admin");
        String key = request.getParameter("key");
        String utype = request.getParameter("utype");
        HashMap map = new HashMap();
	   	map.put("key", key);
	   	map.put("utype", utype);
        List<List> list1  = new ArrayList();
        List<Member> list = memberDAO.selectAll(map);
        int i=0;
        for(Member member:list){
            i++;
            List mlist  = new ArrayList();
            mlist.add(i);
            mlist.add(member.getUname());
            mlist.add(member.getTname());
            mlist.add(member.getTel());
            mlist.add(member.getEmail());
            mlist.add(member.getUtype());
            list1.add(mlist);

        }
        String[] pros = {"序号","用户名","姓名","电话","邮箱","用户类型",};
        Info.writeExcel(request.getRealPath("/upload/")+"/tongji.xls", pros, list1, request, response);

    }
	
	

}
