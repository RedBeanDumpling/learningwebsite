package com.dao;
import java.util.*;

import com.bean.Activity;
import com.bean.Questions;


public interface QuestionsDAO {
	List<Questions> selectAll(HashMap map);
	void add(Questions questions);
	void update(Questions questions);
	Questions findById(int id);
	void delete(int id);
	
	List<Questions> selectRandom(HashMap map);
}
