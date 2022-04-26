package com.dao;
import java.util.*;

import com.bean.Activity;
import com.bean.Kechenlr;


public interface KechenlrDAO {
	List<Kechenlr> selectAll(HashMap map);
	void add(Kechenlr kechenlr);
	void update(Kechenlr kechenlr);
	Kechenlr findById(int id);
	void delete(int id);
}
