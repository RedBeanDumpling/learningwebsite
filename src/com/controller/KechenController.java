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
import com.util.ItemCFDemo;
import com.dao.BaomingDAO;
import com.dao.CategoryDAO;
import com.dao.KechenDAO;
import com.dao.KechenlrDAO;
import com.dao.MemberDAO;
import com.dao.PaperDAO;
import com.dao.PinlunDAO;
import com.dao.StudyrecordDAO;

import java.util.*;

@Controller
public class KechenController {
	@Resource
	KechenDAO kechenDAO;
	@Resource
	CategoryDAO categoryDAO;
	@Resource
	Saveobject saveobject;
	@Resource
	KechenlrDAO kechenlrDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	BaomingDAO baomingDAO;
	@Resource
	PinlunDAO pinlunDAO;
	@Resource
	StudyrecordDAO studyrecordDAO;
	
	@Resource
	PaperDAO paperDAO;

	// 课程详情
	@RequestMapping("kechenDetails")
	public String kechenDetails(int id, HttpServletRequest request) {
		Kechen kechen = kechenDAO.findById(id);
		kechen.setTeacher(memberDAO.findById(kechen.getTeacherid()));
		Category category = categoryDAO.findById(Integer.parseInt(kechen
				.getCategoryid()));
		kechen.setCategory(category);
		request.setAttribute("kechen", kechen);

		HashMap map = new HashMap();
		map.put("kcid", id);
		map.put("flag", "课程视频");
		map.put("shstatus", "通过审核");
		List<Kechenlr> velist = kechenlrDAO.selectAll(map);
		for (Kechenlr ve : velist) {
			Member teacher = memberDAO.findById(Integer.parseInt(ve.getTcid()));
			ve.setTeacher(teacher);
		}
		map.put("flag", "课件");
		List<Kechenlr> fllist = kechenlrDAO.selectAll(map);
		for (Kechenlr fl : fllist) {
			Member teacher = memberDAO.findById(Integer.parseInt(fl.getTcid()));
			fl.setTeacher(teacher);
		}
		map.put("flag", "作业");
		List<Kechenlr> zylist = kechenlrDAO.selectAll(map);
		for (Kechenlr zy : zylist) {
			Member teacher = memberDAO.findById(Integer.parseInt(zy.getTcid()));
			zy.setTeacher(teacher);
		}
		request.setAttribute("velist", velist);
		request.setAttribute("fllist", fllist);
		request.setAttribute("zylist", zylist);

		Member member = (Member) request.getSession().getAttribute(
				"sessionmember");
		if (member != null) {
			map.put("kcid", id);
			map.put("stid", member.getId());
			List<Baoming> bmlist = baomingDAO.selectAll(map);
			request.setAttribute("bmlist", bmlist);
		}

		HashMap ppp = new HashMap();
		ppp.put("kechenid", id);
		List<Pinlun> pllist = pinlunDAO.selectAll(ppp);
		for (Pinlun pinlun : pllist) {
			Member mmm = memberDAO.findById(Integer.parseInt(pinlun
					.getMemberid()));
			pinlun.setMember(mmm);
		}
		request.setAttribute("pllist", pllist);
		
		//考试试题
		
		map.put("kcid", id);
		List<Paper> paperlist = paperDAO.selectAll(map);
		for (Paper paper : paperlist) {
			paper.setKechen(kechenDAO.findById(paper.getKcid()));
			paper.setTeacher(memberDAO.findById(paper.getTeacherid()));
		}
		request.setAttribute("paperlist", paperlist);
		
		return "kechendetails";
	}

	// 后台课程列表
    @RequestMapping("admin/kechenList")
    public String kechenList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        String key = request.getParameter("key");
        String categoryid = request.getParameter("categoryid");

        HashMap map = new HashMap();
        map.put("key", key);
        map.put("categoryid", categoryid);
        List<Kechen> list = kechenDAO.selectAll(map);
        for (Kechen kechen : list) {
            Category category = categoryDAO.findById(Integer.parseInt(kechen
                    .getCategoryid()));
            kechen.setCategory(category);
            kechen.setTeacher(memberDAO.findById(kechen.getTeacherid()));
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Kechen> objectlist = kechenDAO.selectAll(map);
        for (Kechen kechen : objectlist) {
            Category category = categoryDAO.findById(Integer.parseInt(kechen
                    .getCategoryid()));
            kechen.setCategory(category);
            kechen.setTeacher(memberDAO.findById(kechen.getTeacherid()));
        }
        PageInfo<Kechen> pageInfo = new PageInfo<Kechen>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("key", key);
        request.setAttribute("categoryid", categoryid);


        List<Category> ctlist = categoryDAO.selectAll(null);
        request.setAttribute("ctlist", ctlist);
        return "admin/kechenlist";
    }



	

	// 课程信息
    @RequestMapping("kechenMsg")
    public String kechenMsg(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "8",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        String categoryid = request.getParameter("categoryid");
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("categoryid", categoryid);
        map.put("key", key);
        List<Kechen> list = kechenDAO.selectAll(map);
        for (Kechen kechen : list) {
            Category category = categoryDAO.findById(Integer.parseInt(kechen
                    .getCategoryid()));
            kechen.setCategory(category);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Kechen> objectlist = kechenDAO.selectAll(map);
        for (Kechen kechen : objectlist) {
            Category category = categoryDAO.findById(Integer.parseInt(kechen
                    .getCategoryid()));
            kechen.setCategory(category);
        }
        PageInfo<Kechen> pageInfo = new PageInfo<Kechen>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("key", key);
        request.setAttribute("categoryid", categoryid);
        saveobject.getCategoryObject(request);
        return "kechenmsg";
    }

	// 课程添加
	@RequestMapping("admin/kechenAdd")
	public String kechenAdd(Kechen kechen, HttpServletRequest request) {
		kechen.setIstj("no");
		kechenDAO.add(kechen);
		return "redirect:kechenList.do";
	}

	// 编辑页面
	@RequestMapping("admin/kechenShow")
	public String kechenShow(int id, HttpServletRequest request) {
		Kechen kechen = kechenDAO.findById(id);
		request.setAttribute("kechen", kechen);
		return "admin/kechenedit";
	}

	// 课程编辑
	@RequestMapping("admin/kechenEdit")
	public String kechenEdit(Kechen kechen, HttpServletRequest request) {
		kechenDAO.update(kechen);
		return "redirect:kechenList.do";
	}

	// 课程删除
	@RequestMapping("admin/kechenDel")
	public String kechenDel(int id, HttpServletRequest request) {
		Kechen kechen = kechenDAO.findById(id);
		kechen.setDelstatus("1");
		kechenDAO.update(kechen);
		return "redirect:kechenList.do";
	}

	// 跳转页面
	@RequestMapping("admin/skipKechen")
	public String skipKechen(HttpServletRequest request) {
		String flag = request.getParameter("flag") == null ? "" : request
				.getParameter("flag");
		List<Category> ctlist = categoryDAO.selectAll(null);
		request.setAttribute("ctlist", ctlist);
		if (flag.equals("kechenadd")) {
			return "admin/kechenadd";
		} else {
			String id = request.getParameter("id");
			Kechen kechen = kechenDAO.findById(Integer.parseInt(id));
			request.setAttribute("kechen", kechen);
			return "admin/kechenedit";
		}
	}

	// 推荐
	@RequestMapping("admin/updateIstj")
	public String updateIstj(int id, HttpServletRequest request) {
		Kechen kechen = kechenDAO.findById(id);
		if (kechen.getIstj().equals("no")) {
			kechen.setIstj("yes");
		} else {
			kechen.setIstj("no");
		}
		kechenDAO.update(kechen);
		return "redirect:kechenList.do";
	}

	// 在线观看
	@RequestMapping("lookvedio")
	public void lookvedio(HttpServletRequest request,
			HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			String kcid = request.getParameter("kcid");
			String veid = request.getParameter("veid");
			Member member = (Member) request.getSession().getAttribute(
					"sessionmember");
			if (member != null) {
				HashMap map = new HashMap();
				map.put("stid", member.getId());
				map.put("kcid", kcid);
				List<Baoming> list = baomingDAO.selectAll(map);
				if (list.size() == 0) {
					out.print(0);
				} else {
					HashMap map2 = new HashMap();
					map2.put("kclrid", veid);
					map2.put("mid", member.getId());
					List<Studyrecord> recordlist = studyrecordDAO
							.selectAll(map2);
					if (recordlist.size() == 0) {
						Studyrecord studyrecord = new Studyrecord();
						studyrecord.setKclrid(Integer.valueOf(veid));
						studyrecord.setMid(member.getId());
						studyrecordDAO.add(studyrecord);
					}
					Kechenlr kechelr = kechenlrDAO.findById(Integer
							.parseInt(veid));
					out.print(kechelr.getFilename());
				}
			} else {
				out.print(1);
			}
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 下载课件
	@RequestMapping("downfile")
	public String downfile(HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		String kcid = request.getParameter("kcid");
		String filename = request.getParameter("filename");
		String kclrid = request.getParameter("kclrid");
		String isbm = saveobject.isBm(kcid, request);
		Member member = (Member) request.getSession().getAttribute(
				"sessionmember");
		if (isbm.equals("yes")) {
			HashMap map = new HashMap();
			map.put("kclrid", kclrid);
			map.put("mid", member.getId());
			List<Studyrecord> recordlist = studyrecordDAO.selectAll(map);
			if (recordlist.size() == 0) {
				Studyrecord studyrecord = new Studyrecord();
				studyrecord.setKclrid(Integer.valueOf(kclrid));
				studyrecord.setMid(member.getId());
				studyrecordDAO.add(studyrecord);
			}
			return "redirect:upload?filename=" + filename;
		} else {
			redirectAttributes.addFlashAttribute("msg", "请先报名");
			return "redirect:kechenDetails.do?id=" + kcid;
		}
	}

	// 猜你喜欢
	@RequestMapping("Love")
	public String love(HttpServletRequest request) {
		Member member = (Member) request.getSession().getAttribute(
				"sessionmember");
		HashMap map = new HashMap();
		// 学生 7
		map.put("utype", "学生");
		List<Member> ulist = memberDAO.selectAll(map);
		String[] uarray = new String[ulist.size()];
		for (int i = 0; i < ulist.size(); i++) {
			Member mb = ulist.get(i);
			uarray[i] = String.valueOf(mb.getId());
		}

		// 所有课件列表
		map = new HashMap();
		map.put("notin", "作业");
		map.put("shstatus", "通过审核");

		List<Kechenlr> tzlist = kechenlrDAO.selectAll(map);
		String[] tzarray = new String[tzlist.size()];
		for (int i = 0; i < tzlist.size(); i++) {
			Kechenlr tz = tzlist.get(i);
			tzarray[i] = String.valueOf(tz.getId());
		}

		// 浏览记录
		Integer[][] arr2 = new Integer[ulist.size()][];
		int count = 0;
		// System.out.println("arr2.length=="+arr2.length);
		for (int i = 0; i < arr2.length; i++) {
			Member mb = ulist.get(i);
			// System.out.println("userobj"+i+"    ");
			// 创建一维数组
			Integer[] tmpArr = new Integer[tzlist.size()]; // 4
			// System.out.println("tmpArr=="+tmpArr.length);
			// 创建二维数组
			for (int j = 0; j < tmpArr.length; j++) {
				Kechenlr tz = tzlist.get(j);
				// 查询这个课件这个会员的浏览记录
				// 定义浏览记录LIST
				map.put("mid", mb.getId());
				map.put("kclrid", tz.getId());
				List<Studyrecord> readlist = studyrecordDAO.selectAll(map);
				if (readlist.size() > 0) {
					tmpArr[j] = 1;
				} else {
					tmpArr[j] = 0;
				}
			}
			arr2[i] = tmpArr;
		}
		//
		for (int m = 0; m < arr2.length; m++) {
			for (int n = 0; n < arr2[m].length; n++) {
				System.out.println(arr2[m][n] + "  ");
			}
			System.out.println();
		}

		ItemCFDemo u = new ItemCFDemo();
		u.users = uarray;
		u.movies = tzarray;
		u.allUserMovieCommentList = arr2;
		u.membernum = ulist.size();
		u.mvnum = tzlist.size();
		List<String> rtnlist = u.mvlist(String.valueOf(member.getId()));
		List<Kechenlr> lovelist = new ArrayList<Kechenlr>();
		for (String mvid : rtnlist) {
			Kechenlr kclr = kechenlrDAO.findById(Integer.valueOf(mvid));
			kclr.setKechen(kechenDAO.findById(Integer.valueOf(kclr.getKcid())));
			Member teacher = memberDAO
					.findById(Integer.parseInt(kclr.getTcid()));
			kclr.setTeacher(teacher);
			lovelist.add(kclr);
			System.out.println("推荐的课件:" + kclr.getTitle());
		}

		//
		//
		// //
		// // String[] strings = new String[list.size()];
		// // System.out.println("ASDF="+strings);
		// // list.toArray(strings);
		// // System.out.println(list);

		request.setAttribute("lovelist", lovelist);
		return "love";
	}
	
	
	// 前台课程列表
    @RequestMapping("kechenLb")
    public String kechenLb(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        Member member = (Member) request.getSession().getAttribute("sessionmember");
        HashMap map = new HashMap();
        map.put("teacherid", member.getId());
        List<Kechen> list = kechenDAO.selectAll(map);
        for (Kechen kechen : list) {
            Category category = categoryDAO.findById(Integer.parseInt(kechen
                    .getCategoryid()));
            kechen.setCategory(category);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Kechen> objectlist = kechenDAO.selectAll(map);
        for (Kechen kechen : objectlist) {
            Category category = categoryDAO.findById(Integer.parseInt(kechen
                    .getCategoryid()));
            kechen.setCategory(category);
        }
        PageInfo<Kechen> pageInfo = new PageInfo<Kechen>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        return "kechenlb";
    }

	// 去添加课程
	@RequestMapping("toKechenSub")
	public String toKechenAdd(HttpServletRequest request) {
		String flag = request.getParameter("flag") == null ? "" : request
				.getParameter("flag");
		List<Category> ctlist = categoryDAO.selectAll(null);
		request.setAttribute("ctlist", ctlist);
		if (flag.equals("kechenadd")) {
			return "kechenadd";
		} else {
			String id = request.getParameter("id");
			Kechen kechen = kechenDAO.findById(Integer.parseInt(id));
			request.setAttribute("kechen", kechen);
			return "kechenedit";
		}
	}

	// 课程添加
	@RequestMapping("kechenSub")
	public String kechenSub(Kechen kechen, HttpServletRequest request) {
		Member member = (Member) request.getSession().getAttribute(
				"sessionmember");
		kechen.setTeacherid(member.getId());
		kechen.setIstj("no");
		kechen.setDelstatus("0");
		kechenDAO.add(kechen);
		return "redirect:kechenLb.do";
	}

	// 编辑页面
	@RequestMapping("toKechenEdit")
	public String toKechenEdit(int id, HttpServletRequest request) {
		Kechen kechen = kechenDAO.findById(id);
		request.setAttribute("kechen", kechen);
		List<Category> ctlist = categoryDAO.selectAll(null);
		request.setAttribute("ctlist", ctlist);
		return "kechenedit";
	}

	// 课程编辑
	@RequestMapping("kechenSave")
	public String kechenSave(Kechen kechen, HttpServletRequest request) {
		kechenDAO.update(kechen);
		return "redirect:kechenLb.do";
	}

	// 课程删除
	@RequestMapping("kechenDelete")
	public String kechenDelete(int id, HttpServletRequest request) {
		Kechen kechen = kechenDAO.findById(id);
		kechen.setDelstatus("1");
		kechenDAO.update(kechen);
		return "redirect:kechenLb.do";
	}

}
