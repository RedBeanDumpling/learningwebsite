package com.dao;
import java.util.*;

import com.bean.Activity;
import com.bean.Paper;
import com.bean.Paperdetail;
import com.bean.Questions;


public interface PaperdetailDAO {
	List<Paperdetail> selectAll(HashMap map);
	void add(Paperdetail paperdetail);
	void update(Paperdetail paperdetail);
	Paperdetail findById(int id);
	void delete(int id);
}
