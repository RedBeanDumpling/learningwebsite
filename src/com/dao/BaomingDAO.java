package com.dao;
import java.util.*;

import com.bean.Baoming;


public interface BaomingDAO {
	List<Baoming> selectAll(HashMap map);
	void add(Baoming baoming);
	void delete(int id);
}
