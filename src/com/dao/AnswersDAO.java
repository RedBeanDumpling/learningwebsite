package com.dao;
import java.util.*;

import com.bean.Activity;
import com.bean.Answers;
import com.bean.Questions;


public interface AnswersDAO {
	List<Answers> selectAll(HashMap map);
	void add(Answers answers);
	Answers findById(int id);
	void delete(int id);
}
