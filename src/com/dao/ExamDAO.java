package com.dao;
import java.util.*;

import com.bean.Activity;
import com.bean.Exam;
import com.bean.Paper;
import com.bean.Questions;


public interface ExamDAO {
	List<Exam> selectAll(HashMap map);
	void add(Exam exam);
	void update(Exam exam);
	Exam findById(int id);
	void delete(int id);
	List<Exam> selectAllByTeacherId(HashMap map);
}
