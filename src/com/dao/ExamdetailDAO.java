package com.dao;
import java.util.*;

import com.bean.Activity;
import com.bean.Exam;
import com.bean.Examdetail;
import com.bean.Paper;
import com.bean.Questions;


public interface ExamdetailDAO {
	List<Examdetail> selectAll(HashMap map);
	void add(Examdetail examdetail);
	void update(Examdetail examdetail);
	Examdetail findById(int id);
	void delete(int id);
}
