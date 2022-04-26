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
import com.util.Info;
import com.bean.Activity;
import com.bean.Answers;
import com.bean.Category;
import com.bean.Kechen;
import com.bean.Member;
import com.bean.Paper;
import com.bean.Paperdetail;
import com.bean.Questions;
import com.bean.Sysuser;
import com.dao.ActivityDAO;
import com.dao.AnswersDAO;
import com.dao.CategoryDAO;
import com.dao.KechenDAO;
import com.dao.MemberDAO;
import com.dao.PaperDAO;
import com.dao.PaperdetailDAO;
import com.dao.QuestionsDAO;

import java.util.*;

@Controller
public class PaperController {
	@Resource
	QuestionsDAO questionsDAO;
	@Resource
	KechenDAO kechenDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	AnswersDAO answersDAO;
	@Resource
	PaperDAO paperDAO;
	@Resource
	PaperdetailDAO paperdetailDAO;

	// 去组题
	@RequestMapping("toCreatePaper")
	public String toCreatePaper(int kcid, HttpServletRequest request) {
		Member member = (Member) request.getSession().getAttribute(
				"sessionmember");
		Paper paper = new Paper();
		paper.setKcid(kcid);
		paper.setTeacherid(member.getId());
		paper.setDelstatus("0");

		HashMap map = new HashMap();
		map.put("teacherid", member.getId());
		map.put("kcid", kcid);
		map.put("type", "1");
		List<Questions> singlelist = questionsDAO.selectAll(map);
		map.put("type", "2");
		List<Questions> multiplelist = questionsDAO.selectAll(map);

		request.setAttribute("paper", paper);
		request.setAttribute("singlelist", singlelist);
		request.setAttribute("multiplelist", multiplelist);
		return "papercreate";
	}

	@RequestMapping("paperCreate")
	public String paperCreate(Paper paper, HttpServletRequest request) {
		String singlenum = request.getParameter("singlenum");
		String multiplenum = request.getParameter("multiplenum");
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		paper.setUuid(uuid);

		HashMap map = new HashMap();
		map.put("kcid", paper.getKcid());
		map.put("teacherid", paper.getTeacherid());
		map.put("type", 1);
		map.put("qnum", singlenum);
		List<Questions> singleList = questionsDAO.selectRandom(map);
		map.put("qnum", multiplenum);
		map.put("type", "2");
		List<Questions> multiplelist = questionsDAO.selectRandom(map);
		List<Paperdetail> detailList = new ArrayList<Paperdetail>();
		int score = 0;
		int serno = 0;
		for (int i = 0; i < singleList.size(); i++) {
			serno++;
			Questions q = singleList.get(i);
			Paperdetail paperdetail = new Paperdetail();
			paperdetail.setQno(serno);
			paperdetail.setPaperid(uuid);
			paperdetail.setQuestionid(q.getId());
			paperdetail.setType(q.getType());
			score += q.getScore();
			paperdetailDAO.add(paperdetail);
		}
		for (int j = 0; j < multiplelist.size(); j++) {
			serno++;
			Questions q = multiplelist.get(j);
			Paperdetail paperdetail = new Paperdetail();
			paperdetail.setQno(serno);
			paperdetail.setPaperid(uuid);
			paperdetail.setQuestionid(q.getId());
			paperdetail.setType(q.getType());
			score += q.getScore();
			paperdetailDAO.add(paperdetail);
		}
		paper.setScore(score);
		paperDAO.add(paper);
		return "redirect:paperList.do";
	}

	// 试卷列表
    @RequestMapping("paperList")
    public String paperList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        Member member = (Member) request.getSession().getAttribute(
                "sessionmember");
        String key = request.getParameter("key");
        String kcid = request.getParameter("kcid");// 课程
        HashMap map = new HashMap();
        map.put("key", key);
        map.put("kcid", kcid);
        map.put("teacherid", member.getId());
        List<Paper> list = paperDAO.selectAll(map);
        for (Paper paper : list) {
            paper.setKechen(kechenDAO.findById(paper.getKcid()));
            paper.setTeacher(memberDAO.findById(paper.getTeacherid()));
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Paper> objectlist = paperDAO.selectAll(map);
        for (Paper paper : objectlist) {
            paper.setKechen(kechenDAO.findById(paper.getKcid()));
            paper.setTeacher(memberDAO.findById(paper.getTeacherid()));
        }
        PageInfo<Paper> pageInfo = new PageInfo<Paper>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("key", key);
        request.setAttribute("kcid", kcid);


        HashMap map1 = new HashMap();
        map1.put("teacherid", member.getId());
        List<Kechen> kclist = kechenDAO.selectAll(map1);
        request.setAttribute("kclist", kclist);
        return "paperlist";
    }

	// 预览
	@RequestMapping("paperView")
	public String paperView(int id, HttpServletRequest request) {
		Paper paper = paperDAO.findById(id);
		paper.setTeacher(memberDAO.findById(paper.getTeacherid()));
		paper.setKechen(kechenDAO.findById(paper.getKcid()));
		HashMap map = new HashMap();
		map.put("paperid", paper.getUuid());
		List<Paperdetail> detailList1 = new ArrayList<Paperdetail>();//单选
		List<Paperdetail> detailList2 = new ArrayList<Paperdetail>();//多选
		List<Paperdetail> tempList = paperdetailDAO.selectAll(map);
		for(Paperdetail detail:tempList){
			Questions question = questionsDAO.findById(detail.getQuestionid());
			HashMap map1 = new HashMap();
			map1.put("questionid", question.getUuid());
			question.setAnswerslist(answersDAO.selectAll(map1));
			detail.setQuestion(question);
			if(detail.getType().equals("1")){
				detailList1.add(detail);
			}else if(detail.getType().equals("2")){
				detailList2.add(detail);
			}
		}
		paper.setDetailList1(detailList1);
		paper.setDetailList2(detailList2);
		request.setAttribute("paper", paper);
		return "paperView";
	}

	// 删除
	@RequestMapping("paperDel")
	public String paperDel(int id, HttpServletRequest request) {
		Paper paper = paperDAO.findById(id);
		paper.setDelstatus("1");
		paperDAO.update(paper);
		return "redirect:paperList.do";
	}

	
	
	
}
