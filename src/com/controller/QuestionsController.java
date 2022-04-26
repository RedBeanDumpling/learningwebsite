package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
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
import com.bean.Examdetail;
import com.bean.Kechen;
import com.bean.Member;
import com.bean.Questions;
import com.bean.Sysuser;
import com.dao.ActivityDAO;
import com.dao.AnswersDAO;
import com.dao.CategoryDAO;
import com.dao.ExamdetailDAO;
import com.dao.KechenDAO;
import com.dao.MemberDAO;
import com.dao.QuestionsDAO;

import java.util.*;

@Controller
public class QuestionsController{
	@Resource
	QuestionsDAO questionsDAO;
	@Resource
	KechenDAO kechenDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	CategoryDAO categoryDAO;
	@Resource
	AnswersDAO answersDAO;
	@Resource
	ExamdetailDAO examdetailDAO;
	
	//题库列表
    @RequestMapping("questionsList")
    public String questionsList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        Member member = (Member) request.getSession().getAttribute(
                "sessionmember");
        String key = request.getParameter("key");
        String type = request.getParameter("type");//题型
        String kcid  = request.getParameter("kcid");//课程

        HashMap map = new HashMap();
        map.put("key", key);
        map.put("type", type);
        map.put("kcid", kcid);
        map.put("teacherid", member.getId());
        List<Questions> list = questionsDAO.selectAll(map);
        for(Questions questions:list){
            questions.setKechen(kechenDAO.findById(questions.getKcid()));
            questions.setTeacher(memberDAO.findById(questions.getTeacherid()));
            HashMap m = new HashMap();
            m.put("questionid", questions.getId());
            List<Examdetail> detailList = examdetailDAO.selectAll(m);
            int ksNum = detailList.size();//此题被做次数
            if(ksNum>0){
                //查正确个数
                int zqNum = 0;
                for(Examdetail examdetail:detailList){
                    if(questions.getAnswer().equals(examdetail.getAnswer())){
                        zqNum++;
                    }
                }
                Double zqlv = Double.valueOf(zqNum)/Double.valueOf(ksNum);
                zqlv = zqlv * 100;
                DecimalFormat df = new DecimalFormat("#.00");
                questions.setZql(df.format(zqlv)+"%");
            }
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Questions> objectlist = questionsDAO.selectAll(map);
        for(Questions questions:objectlist){
            questions.setKechen(kechenDAO.findById(questions.getKcid()));
            questions.setTeacher(memberDAO.findById(questions.getTeacherid()));
            HashMap m = new HashMap();
            m.put("questionid", questions.getId());
            List<Examdetail> detailList = examdetailDAO.selectAll(m);
            int ksNum = detailList.size();//此题被做次数
            if(ksNum>0){
                //查正确个数
                int zqNum = 0;
                for(Examdetail examdetail:detailList){
                    if(questions.getAnswer().equals(examdetail.getAnswer())){
                        zqNum++;
                    }
                }
                Double zqlv = Double.valueOf(zqNum)/Double.valueOf(ksNum);
                zqlv = zqlv * 100;
                DecimalFormat df = new DecimalFormat("#.00");
                questions.setZql(df.format(zqlv)+"%");
            }
        }
        PageInfo<Questions> pageInfo = new PageInfo<Questions>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("key", key);
        request.setAttribute("type", type);
        request.setAttribute("kcid", kcid);


        HashMap map1 = new HashMap();
        map1.put("teacherid", member.getId());
        List<Kechen> kclist = kechenDAO.selectAll(map1);
        request.setAttribute("kclist", kclist);

        return "questionslist";
    }
	
	// 去添加试题
		@RequestMapping("toQuestionsAdd")
		public String toQuestionsAdd(HttpServletRequest request) {
			Member member = (Member) request.getSession().getAttribute(
					"sessionmember");
			HashMap map = new HashMap();
			map.put("teacherid", member.getId());
			List<Kechen> kclist = kechenDAO.selectAll(map);
			request.setAttribute("kclist", kclist);
			return "questionadd";
		}
	
	//试题添加提交
	@RequestMapping("questionsAdd")
	public String questionsAdd(Questions questions,HttpServletRequest request) {
		String options[] = request.getParameterValues("options");
		String answer = "";
		for(int i=0;i<options.length;i++){
			answer += options[i];
		}
		String aoption = request.getParameter("aoption");
		String boption = request.getParameter("boption");
		String coption = request.getParameter("coption");
		String doption = request.getParameter("doption");
		Member member = (Member) request.getSession().getAttribute(
				"sessionmember");
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		questions.setUuid(uuid);
		questions.setAnswer(answer);
		questions.setTeacherid(member.getId());
		questions.setDelstatus("0");
		questionsDAO.add(questions);
		
		Answers answers1 = new Answers();
		answers1.setQuestionid(uuid);
		answers1.setOption("A");
		answers1.setContent(aoption);
		answersDAO.add(answers1);
		
		Answers answers2 = new Answers();
		answers2.setQuestionid(uuid);
		answers2.setOption("B");
		answers2.setContent(boption);
		answersDAO.add(answers2);
		
		Answers answers3 = new Answers();
		answers3.setQuestionid(uuid);
		answers3.setOption("C");
		answers3.setContent(coption);
		answersDAO.add(answers3);
		
		Answers answers4 = new Answers();
		answers4.setQuestionid(uuid);
		answers4.setOption("D");
		answers4.setContent(doption);
		answersDAO.add(answers4);
		
		
		
		return "redirect:questionsList.do";
	}
	
	
	//编辑页面
	@RequestMapping("toQuestionsEdit")
	public String toQuestionsEdit(int id,HttpServletRequest request) {
		Member member = (Member) request.getSession().getAttribute(
				"sessionmember");
		Questions questions = questionsDAO.findById(id);
		HashMap map1 = new HashMap();
		map1.put("questionid", questions.getUuid());
		List<Answers> answersList = answersDAO.selectAll(map1);
		String aoption = "";
		String boption = "";
		String coption = "";
		String doption = "";
		for(Answers answers:answersList){
			if(answers.getOption().equals("A")){
				aoption = answers.getContent();
			}
			if(answers.getOption().equals("B")){
				boption = answers.getContent();
			}
			if(answers.getOption().equals("C")){
				coption = answers.getContent();
			}
			if(answers.getOption().equals("D")){
				doption = answers.getContent();
			}
		}
		request.setAttribute("aoption", aoption);
		request.setAttribute("boption", boption);
		request.setAttribute("coption", coption);
		request.setAttribute("doption", doption);
		
		
		HashMap map = new HashMap();
		map.put("teacherid", member.getId());
		List<Kechen> kclist = kechenDAO.selectAll(map);
		request.setAttribute("kclist", kclist);
		request.setAttribute("questions", questions);
		return "questionedit";
	}
	
	
	//编辑提交
	@RequestMapping("questionsEdit")
	public String questionsEdit(Questions questions,HttpServletRequest request) {
		String options[] = request.getParameterValues("options");
		String answer = "";
		for(int i=0;i<options.length;i++){
			answer += options[i];
		}
		String aoption = request.getParameter("aoption");
		String boption = request.getParameter("boption");
		String coption = request.getParameter("coption");
		String doption = request.getParameter("doption");
		Member member = (Member) request.getSession().getAttribute(
				"sessionmember");
		String uuid = questions.getUuid();
		questions.setAnswer(answer);
		questionsDAO.update(questions);
		//先删除所有选项
		HashMap map = new HashMap();
		map.put("questionid", questions.getUuid());
		List<Answers> answersList = answersDAO.selectAll(map);
		for(Answers a:answersList){
			answersDAO.delete(a.getId());
		}
		Answers answers1 = new Answers();
		answers1.setQuestionid(uuid);
		answers1.setOption("A");
		answers1.setContent(aoption);
		answersDAO.add(answers1);
		
		Answers answers2 = new Answers();
		answers2.setQuestionid(uuid);
		answers2.setOption("B");
		answers2.setContent(boption);
		answersDAO.add(answers2);
		
		Answers answers3 = new Answers();
		answers3.setQuestionid(uuid);
		answers3.setOption("C");
		answers3.setContent(coption);
		answersDAO.add(answers3);
		
		Answers answers4 = new Answers();
		answers4.setQuestionid(uuid);
		answers4.setOption("D");
		answers4.setContent(doption);
		answersDAO.add(answers4);
		
		return "redirect:questionsList.do";
	}
	
	//删除
	@RequestMapping("questionsDel")
	public String questionsDel(int id,HttpServletRequest request) {
		Questions questions = questionsDAO.findById(id);
		questions.setDelstatus("1");
		questionsDAO.update(questions);
		return "redirect:questionsList.do";
	}
	
	
	

}
