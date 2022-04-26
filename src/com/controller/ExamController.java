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
import com.bean.Baoming;
import com.bean.Category;
import com.bean.Exam;
import com.bean.Examdetail;
import com.bean.Kechen;
import com.bean.Member;
import com.bean.Paper;
import com.bean.Paperdetail;
import com.bean.Questions;
import com.bean.Sysuser;
import com.dao.ActivityDAO;
import com.dao.AnswersDAO;
import com.dao.BaomingDAO;
import com.dao.CategoryDAO;
import com.dao.ExamDAO;
import com.dao.ExamdetailDAO;
import com.dao.KechenDAO;
import com.dao.MemberDAO;
import com.dao.PaperDAO;
import com.dao.PaperdetailDAO;
import com.dao.QuestionsDAO;

import java.util.*;

@Controller
public class ExamController {
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
	@Resource
	ExamDAO examDAO;
	@Resource
	ExamdetailDAO examdetailDAO;
	@Resource
	BaomingDAO baomingDAO;

	// 检查某学生是否参加过该次考试
	@RequestMapping("checkStatus")
	public void checkStatus(String paperid, HttpServletRequest request,
			HttpServletResponse response) {
		Member member = (Member) request.getSession().getAttribute(
				"sessionmember");
		try {
			PrintWriter out = response.getWriter();
			Paper paper = paperDAO.findById(Integer.valueOf(paperid));
			HashMap map1 = new HashMap();
			map1.put("stid", member.getId());
			map1.put("kcid", paper.getKcid());
			List<Baoming> bmlist = baomingDAO.selectAll(map1);
			if (bmlist.size() == 0) {
				out.print(-1);
			}else{
				HashMap map = new HashMap();
				map.put("paperid", paperid);
				map.put("stuid", member.getId());
				List<Exam> list = examDAO.selectAll(map);
				if (list.size() == 0) {
					out.print(0);
				} else {
					out.print(1);
				}
			}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 去考试界面toExam
	@RequestMapping("toExam")
	public String toExam(int id, HttpServletRequest request) {
		Paper paper = paperDAO.findById(id);
		paper.setTeacher(memberDAO.findById(paper.getTeacherid()));
		paper.setKechen(kechenDAO.findById(paper.getKcid()));
		HashMap map = new HashMap();
		map.put("paperid", paper.getUuid());
		List<Paperdetail> detailList1 = new ArrayList<Paperdetail>();// 单选
		List<Paperdetail> detailList2 = new ArrayList<Paperdetail>();// 多选
		List<Paperdetail> tempList = paperdetailDAO.selectAll(map);
		String ids = "";
		int i = 0;
		for (Paperdetail detail : tempList) {
			i++;
			Questions question = questionsDAO.findById(detail.getQuestionid());
			ids += question.getUuid();
			if (i <= tempList.size() - 1) {
				ids += ",";
			}
			HashMap map1 = new HashMap();
			map1.put("questionid", question.getUuid());
			question.setAnswerslist(answersDAO.selectAll(map1));
			detail.setQuestion(question);
			if (detail.getType().equals("1")) {
				detailList1.add(detail);
			} else if (detail.getType().equals("2")) {
				detailList2.add(detail);
			}
		}
		paper.setDetailList1(detailList1);
		paper.setDetailList2(detailList2);
		request.setAttribute("paper", paper);
		request.setAttribute("ids", ids);
		return "exam";
	}

	// 交卷
	@RequestMapping("examSub")
	public String examSub(HttpServletRequest request) {
		Member member = (Member) request.getSession().getAttribute(
				"sessionmember");
		String ids = request.getParameter("ids");
		String array[] = ids.split(",");
		String paperid = request.getParameter("paperid");
		Exam exam = new Exam();
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		exam.setUuid(uuid);
		exam.setStuid(member.getId());
		exam.setPaperid(Integer.valueOf(paperid));
		exam.setSavetime(Info.getDateStr());
		int totalScore = 0;
		for (int i = 0; i < array.length; i++) {
			// String an[] = request.getParameterValues("an"+array[i]);
			HashMap map = new HashMap();
			map.put("uuid", array[i]);
			Questions question = questionsDAO.selectAll(map).get(0);
			if (question.getType().equals("1")) {
				String an = request.getParameter("an" + array[i]);
				Examdetail examdetail = new Examdetail();
				examdetail.setExamid(uuid);
				examdetail.setQuestionid(question.getId());
				examdetail.setAnswer(an == null ? "" : an);
				examdetailDAO.add(examdetail);
				if (an != null && an.equals(question.getAnswer())) {
					totalScore += question.getScore();
				}
			} else if (question.getType().equals("2")) {
				String dxan[] = request.getParameterValues("an" + array[i]);
				if (dxan != null) {
					String options = "";
					for (int j = 0; j < dxan.length; j++) {
						options += dxan[j];
					}
					Examdetail examdetail = new Examdetail();
					examdetail.setExamid(uuid);
					examdetail.setQuestionid(question.getId());
					examdetail.setAnswer(options);
					examdetailDAO.add(examdetail);
					if (options.equals(question.getAnswer())) {
						totalScore += question.getScore();
					}
				}
			}
		}
		exam.setScore(totalScore);
		examDAO.add(exam);
		return "redirect:examRecordList.do";
	}

	// 考试记录
    @RequestMapping("examRecordList")
    public String examRecordList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        Member member = (Member) request.getSession().getAttribute(
                "sessionmember");
        HashMap map = new HashMap();
        map.put("stuid", member.getId());
        List<Exam> list = examDAO.selectAll(map);
        for (Exam exam : list) {
            Paper paper = paperDAO.findById(exam.getPaperid());
            paper.setKechen(kechenDAO.findById(paper.getKcid()));
            exam.setPaper(paper);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Exam> objectlist = examDAO.selectAll(map);
        for (Exam exam : objectlist) {
            Paper paper = paperDAO.findById(exam.getPaperid());
            paper.setKechen(kechenDAO.findById(paper.getKcid()));
            exam.setPaper(paper);
        }
        PageInfo<Exam> pageInfo = new PageInfo<Exam>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        return "examRecordlist";
    }

	// 考试记录 老师
    @RequestMapping("examRecordListForTeacher")
    public String examRecordListForTeacher(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "10",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        String pid = request.getParameter("pid");
        Member member = (Member) request.getSession().getAttribute(
                "sessionmember");
        HashMap map = new HashMap();
        map.put("teacherid", member.getId());
        map.put("pid", pid);
        List<Exam> list = examDAO.selectAllByTeacherId(map);
        for (Exam exam : list) {
            Paper paper = paperDAO.findById(exam.getPaperid());
            paper.setKechen(kechenDAO.findById(paper.getKcid()));
            exam.setStudent(memberDAO.findById(exam.getStuid()));
            exam.setPaper(paper);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Exam> objectlist = examDAO.selectAllByTeacherId(map);
        for (Exam exam : objectlist) {
            Paper paper = paperDAO.findById(exam.getPaperid());
            paper.setKechen(kechenDAO.findById(paper.getKcid()));
            exam.setStudent(memberDAO.findById(exam.getStuid()));
            exam.setPaper(paper);
        }
        PageInfo<Exam> pageInfo = new PageInfo<Exam>(objectlist);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);

        List<Paper> plist = paperDAO.selectAll(map);
        for(Paper paper:plist){
            paper.setKechen(kechenDAO.findById(paper.getKcid()));
        }
        request.setAttribute("plist", plist);
        request.setAttribute("pid", pid);
        return "examRecordlistfortea";
    }




	// 查看考试结果
	@RequestMapping("examResult")
	public String examResult(int id, HttpServletRequest request) {
		Exam exam = examDAO.findById(id);
		// HashMap m = new HashMap();
		// m.put("examid", exam.getUuid());
		// List<Examdetail> examdetailList = examdetailDAO.selectAll(m);
		// exam.setExamdetailList(examdetailList);

		Paper paper = paperDAO.findById(exam.getPaperid());
		paper.setTeacher(memberDAO.findById(paper.getTeacherid()));
		paper.setKechen(kechenDAO.findById(paper.getKcid()));
		HashMap map = new HashMap();
		map.put("paperid", paper.getUuid());
		List<Paperdetail> detailList1 = new ArrayList<Paperdetail>();// 单选
		List<Paperdetail> detailList2 = new ArrayList<Paperdetail>();// 多选
		List<Paperdetail> tempList = paperdetailDAO.selectAll(map);
		String ids = "";
		for (Paperdetail detail : tempList) {
			Questions question = questionsDAO.findById(detail.getQuestionid());
			HashMap m = new HashMap();
			m.put("examid", exam.getUuid());
			m.put("questionid", question.getId());
			List<Examdetail> examdetailList = examdetailDAO.selectAll(m);
			if (examdetailList.size() > 0) {
				question.setMyanswer(examdetailList.get(0).getAnswer());
			}
			HashMap map1 = new HashMap();
			map1.put("questionid", question.getUuid());
			question.setAnswerslist(answersDAO.selectAll(map1));
			detail.setQuestion(question);
			if (detail.getType().equals("1")) {
				detailList1.add(detail);
			} else if (detail.getType().equals("2")) {
				detailList2.add(detail);
			}
		}
		paper.setDetailList1(detailList1);
		paper.setDetailList2(detailList2);
		request.setAttribute("paper", paper);
		request.setAttribute("exam", exam);
		return "examresult";
	}

	// 删除考试记录
	@RequestMapping("examDel")
	public String examDel(int id, HttpServletRequest request) {
		Exam exam = examDAO.findById(id);
		HashMap map = new HashMap();
		map.put("examid", exam.getUuid());
		List<Examdetail> examdetailList = examdetailDAO.selectAll(map);
		for (Examdetail e : examdetailList) {
			examdetailDAO.delete(e.getId());
		}
		examDAO.delete(id);
		return "redirect:examRecordList.do";
	}
	
	// 删除考试记录 教师
	@RequestMapping("examDelforTeacher")
	public String examDelforTeacher(int id, HttpServletRequest request) {
		Exam exam = examDAO.findById(id);
		HashMap map = new HashMap();
		map.put("examid", exam.getUuid());
		List<Examdetail> examdetailList = examdetailDAO.selectAll(map);
		for (Examdetail e : examdetailList) {
			examdetailDAO.delete(e.getId());
		}
		examDAO.delete(id);
		return "redirect:examRecordListForTeacher.do";
	}
	
	
}
