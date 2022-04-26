package com.dao;
import java.util.*;

import com.bean.Activity;
import com.bean.Paper;
import com.bean.Questions;


public interface PaperDAO {
	List<Paper> selectAll(HashMap map);
	void add(Paper paper);
	void update(Paper paper);
	Paper findById(int id);
	void delete(int id);
}
